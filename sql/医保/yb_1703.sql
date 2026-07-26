
IF OBJECT_ID(N'dbo.t_yb_sqtx_fk', N'U') IS NULL
BEGIN
    CREATE TABLE [dbo].[t_yb_sqtx_fk](
        id INT NOT NULL IDENTITY(1,1),
        -- 就诊标识；对齐 t_yb_sqtx_fh.mdtrtid / 零售单 mdtrt_id
        mdtrtid VARCHAR(50) NOT NULL,
        -- 违规标识；对齐 t_yb_sqtx_fh.jrid / 1703 入参 jrid
        jrid VARCHAR(50) NOT NULL,
        -- 处理方式（拼音缩写，对齐业务命名习惯）；对应 1703 入参 dspoway
        -- 1：继续执行医嘱，2：返回修改医嘱
        clfs VARCHAR(3) NOT NULL,
        -- 处理原因；对应 1703 入参 dspowayrea；clfs=1 时必填
        clyy VARCHAR(200) NULL,
        -- 本条反馈上报标志；语义对齐就诊 SCBZ：0 待传，1 成功，-1 失败
        SCBZ smallint NOT NULL CONSTRAINT DF_t_yb_sqtx_fk_SCBZ DEFAULT (0),
        -- 本条反馈返回信息；语义对齐就诊 FHXX
        FHXX NVARCHAR(4000) NULL,
        PRIMARY KEY (id)
    );

    CREATE INDEX IX_t_yb_sqtx_fk_mdtrtid ON dbo.t_yb_sqtx_fk(mdtrtid);
    CREATE INDEX IX_t_yb_sqtx_fk_SCBZ ON dbo.t_yb_sqtx_fk(SCBZ);

    EXEC sp_addextendedproperty 'MS_Description', '医保事前提醒结果反馈（1703 药师处置暂存，Agent 扩展）', 'SCHEMA', dbo, 'table', t_yb_sqtx_fk, null, null;
    EXEC sp_addextendedproperty 'MS_Description', 'id', 'SCHEMA', dbo, 'table', t_yb_sqtx_fk, 'column', id;
    EXEC sp_addextendedproperty 'MS_Description', '就诊标识;对应 t_yb_sqtx_fh.mdtrtid / 零售单编号', 'SCHEMA', dbo, 'table', t_yb_sqtx_fk, 'column', mdtrtid;
    EXEC sp_addextendedproperty 'MS_Description', '违规标识;对应 t_yb_sqtx_fh.jrid', 'SCHEMA', dbo, 'table', t_yb_sqtx_fk, 'column', jrid;
    EXEC sp_addextendedproperty 'MS_Description', '处理方式;1：继续执行医嘱，2：返回修改医嘱；对应1703入参 dspoway', 'SCHEMA', dbo, 'table', t_yb_sqtx_fk, 'column', clfs;
    EXEC sp_addextendedproperty 'MS_Description', '处理原因;clfs=1 时必填；对应1703入参 dspowayrea', 'SCHEMA', dbo, 'table', t_yb_sqtx_fk, 'column', clyy;
    EXEC sp_addextendedproperty 'MS_Description', '上报标志;0 待传，1 成功，-1 失败', 'SCHEMA', dbo, 'table', t_yb_sqtx_fk, 'column', SCBZ;
    EXEC sp_addextendedproperty 'MS_Description', '上传返回信息', 'SCHEMA', dbo, 'table', t_yb_sqtx_fk, 'column', FHXX;
END
GO

-- 若现场曾执行旧版 t_yb_warnsinfo，请手工迁移或废弃后改用本表，程序不再读写旧表名。
