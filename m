Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F013B6352
	for <linux-usb@vger.kernel.org>; Sat,  4 Jul 2026 12:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783169728; cv=none; b=jSTpdEWp5dW5jJetwCS4eDk/PxX1B8G8WjhexvrAmf4NcZp+5WddF94hBKBhIqFyPj7ik+OKNZfGusxst43KmO/JidA46hCGASmyWcw7fC6rHvaiGTV8lDjuYmjdeMS0wk+7irIPb8GX+mX2wo1YOIPS6rEnx7D6NHTM8MS98ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783169728; c=relaxed/simple;
	bh=7Ti4birx9ZhBE8tHz/XlcHdoOwrE9eEoweTUNZOgVMc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=Y2P/vbuf/8b5GytXtvEnO7wL8pfDoieKW850MH6vcekCBBtC3bJNWTrFWBgj/Us+PqGjyWsck2k17qdwxTFK9XNfPlBYqJYBSH+Itz3j3sK3hDOVzs925MQPrqvftCos3httCxnfeyL0ulZqvrheRmDWIbSixn8H6VOg6ahisQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iqsewdgc; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iqsewdgc"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84592b55832so1217518b3a.3
        for <linux-usb@vger.kernel.org>; Sat, 04 Jul 2026 05:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783169709; x=1783774509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=MS3BIkzvEU3uW1zM8eJb13sdee+BvNhbNdXbN75EOwQ=;
        b=IqsewdgclUdNe0fWbDXc9YpZm+Q/dHKQpbveYHfVKHwOP+cgXGRY3HJrKq0rN2GFtc
         rPTNemGyEAnMdd3lHLf2WIIhxySNNoG10LYWU5Tivjp4JWJG6wV+wMGbI9WrP3+fiydo
         B7p+Ax73wU4WPrGb3+MjN68Jvq1aGoVsD4U2ddzRMnNdTIFNNHpNjHdph/vYnuinfk97
         ZU3NEYkjvciiGicK2WXfzkB6XJIVmBHq5g7LWKN/sl/z1aOiud9SbqBSuRnRsAklg4bX
         b8kbW3kGU2Q+OdXNt1vWGQIn3edTBxFtkbu97EeveWWcIMtPXa2OENLbPr9trAGYYJZf
         Ogqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783169709; x=1783774509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MS3BIkzvEU3uW1zM8eJb13sdee+BvNhbNdXbN75EOwQ=;
        b=kxcpBxRxjbL858C9vNtLYPCc3cRCOfgYRY5o+L6JxkTcgKppr+aRP3+IJqbtp57vFr
         393FuvWAQpSbRpy9mhcpLzrWTj65MsUAQ+xzKPOEz7qdUqkMtPsjH8CzletoeNQFvpve
         IjFHmEokhfV8zivx46aYPHMC75iXSfcOOrtG9TYfGpNzIx42y5W3bPaYvgXZvi3o3FKy
         u+Yi3bt/vaRLZsBltEOyLsM4hiqrU+C5aguQbsIkLH78COOXLm1vxrftGRA4XIoImpAl
         krDZQ3R5T4+dIsNMwj8ISpPWKRZQc3aTUYWgPRqyP2DGGDs7dr0pXQjjThUU7t0lE+IQ
         xm/w==
X-Forwarded-Encrypted: i=1; AFNElJ9PKqwvRTrRepepstipUDmnRSLnVJJwkMKX0ldKfZs99h5AEPiBibJgPDZRhx8EllvH/qCVRLe56io=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv2PNdcqA5/yNJB/qxcZBmEQUkRFZik78xo1WGjE+aaLRu0CIv
	gfYTid1rY6wNM8a+a+LmTVBk8LZ8+/4UmYz12MjGBoazj5JtjdOV7PRQ
X-Gm-Gg: AfdE7clHVAfYT4mrGz90Qf/MPoBwtL8txyKwmi1WuEuyP6CwoOMAqOrfktGaakHwXxM
	oIIIjhJwhHQtbShjp5XFcpgP05mton9W7oQlEkzgrSoTJzZVoUR93oKjSZoKnPQ4d5FcbRlyJTB
	a23oOVs0AfL5zigroXjgBFcunRIeRhQXN/IS0kCWlRHxE5R/wvTCchvDtzTwIpfV6Ws2YxD08Gc
	QiAtwCYGSyyJ7cfQ7mlxYo6DMqM2p5+udk1WUusc8xyCAmSlL01Lg/Ng5tNPgan+Lc6OOvolHBz
	byeIx1WvkB7nZjEMr2qYz7O77QCt1nlV6A3D9Nkp27wJFTFPaCPo93wNzZ04vu16f/0BKH7TrJC
	ueb558e3iSQv2njPro5cftxAb3h2IWb1xXsYUuXD7rcRyf0pMBEVwy0maw66SXmXEtgsLf1VL5e
	drRA==
X-Received: by 2002:a05:6a00:22c7:b0:845:48be:b046 with SMTP id d2e1a72fcca58-847f6f1025fmr3033740b3a.36.1783169709364;
        Sat, 04 Jul 2026 05:55:09 -0700 (PDT)
Received: from lgs.. ([118.193.39.24])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b95c89sm1262976b3a.15.2026.07.04.05.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 05:55:08 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Mike Christie <michael.christie@oracle.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] usb: gadget: f_tcm: fix remaining nexus NULL dereferences
Date: Sat,  4 Jul 2026 20:54:59 +0800
Message-ID: <20260704125459.4008712-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The previous nexus NULL-dereference fix added checks to the normal
command submission paths, but two UASP paths still dereference
tpg->tpg_nexus without checking it first.

A TASK MANAGEMENT request reaches usbg_submit_tmr(), which fetches
tvn_se_sess directly from tpg->tpg_nexus. The RC_OVERLAPPED_TAG path in
usbg_cmd_work() does the same before walking sess_cmd_map for the active
command with the same tag.

If userspace drops the nexus after the command is queued, these paths can
observe a NULL tpg_nexus and crash before they can ignore the command like
the already-fixed command paths do.

Commands that reach the workqueue have already been allocated from the
session tag pool by usbg_get_cmd(), and UASP commands may have been
inserted into the stream hash. Clean up those resources before returning
from nexus-missing paths.

Store the session pointer in struct usbg_cmd so the cleanup path does not
need to dereference tpg_nexus after it becomes NULL.

Fixes: b9fde5073553 ("usb: gadget: f_tcm: Fix NULL pointer dereferences in nexus handling")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
v2:
  - Clean up the session tag pool and stream hash before returning from
    nexus-missing paths, as suggested by Thinh.
  - Store the session pointer in struct usbg_cmd so the cleanup path does
    not need to dereference tpg_nexus after it becomes NULL.

 drivers/usb/gadget/function/f_tcm.c | 48 ++++++++++++++++++++++++++---
 drivers/usb/gadget/function/tcm.h   |  1 +
 2 files changed, 45 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/function/f_tcm.c
index 34d9f49e9987..89f9b3c97209 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -725,7 +725,7 @@ static void uasp_status_data_cmpl(struct usb_ep *ep, struct usb_request *req)
 		    cmd->tmr_rsp != RC_RESPONSE_UNKNOWN) {
 			struct se_session *se_sess;
 
-			se_sess = fu->tpg->tpg_nexus->tvn_se_sess;
+			se_sess = cmd->se_sess;
 			sbitmap_queue_clear(&se_sess->sess_tag_pool,
 					    cmd->se_cmd.map_tag,
 					    cmd->se_cmd.map_cpu);
@@ -1186,14 +1186,41 @@ static int usbg_send_read_response(struct se_cmd *se_cmd)
 
 static void usbg_aborted_task(struct se_cmd *se_cmd);
 
+static void usbg_cleanup_queued_cmd(struct usbg_cmd *cmd)
+{
+	struct se_session *se_sess = cmd->se_sess;
+
+	if (cmd->fu->flags & USBG_IS_UAS) {
+		struct uas_stream *stream;
+
+		stream = &cmd->fu->stream[cmd->se_cmd.map_tag];
+		if (hash_hashed(&stream->node))
+			hash_del(&stream->node);
+	}
+
+	sbitmap_queue_clear(&se_sess->sess_tag_pool,
+			    cmd->se_cmd.map_tag,
+			    cmd->se_cmd.map_cpu);
+}
+
 static void usbg_submit_tmr(struct usbg_cmd *cmd)
 {
+	struct tcm_usbg_nexus *tv_nexus;
 	struct se_session *se_sess;
 	struct se_cmd *se_cmd;
 	int flags = TARGET_SCF_ACK_KREF;
 
 	se_cmd = &cmd->se_cmd;
-	se_sess = cmd->fu->tpg->tpg_nexus->tvn_se_sess;
+	tv_nexus = cmd->fu->tpg->tpg_nexus;
+	if (!tv_nexus) {
+		struct usb_gadget *gadget = fuas_to_gadget(cmd->fu);
+
+		dev_err(&gadget->dev, "Missing nexus for TMR, ignoring command\n");
+		usbg_cleanup_queued_cmd(cmd);
+		return;
+	}
+
+	se_sess = tv_nexus->tvn_se_sess;
 
 	target_submit_tmr(se_cmd, se_sess,
 			  cmd->response_iu.add_response_info,
@@ -1226,6 +1253,7 @@ static void usbg_submit_cmd(struct usbg_cmd *cmd)
 		struct usb_gadget *gadget = fuas_to_gadget(cmd->fu);
 
 		dev_err(&gadget->dev, "Missing nexus, ignoring command\n");
+		usbg_cleanup_queued_cmd(cmd);
 		return;
 	}
 
@@ -1271,12 +1299,22 @@ static void usbg_cmd_work(struct work_struct *work)
 skip:
 	if (cmd->tmr_rsp == RC_OVERLAPPED_TAG) {
 		struct f_uas *fu = cmd->fu;
+		struct tcm_usbg_nexus *tv_nexus;
 		struct se_session *se_sess;
 		struct uas_stream *stream = NULL;
 		struct hlist_node *tmp;
 		struct usbg_cmd *active_cmd = NULL;
 
-		se_sess = cmd->fu->tpg->tpg_nexus->tvn_se_sess;
+		tv_nexus = fu->tpg->tpg_nexus;
+		if (!tv_nexus) {
+			struct usb_gadget *gadget = fuas_to_gadget(fu);
+
+			dev_err(&gadget->dev, "Missing nexus for overlapped tag, ignoring command\n");
+			usbg_cleanup_queued_cmd(cmd);
+			return;
+		}
+
+		se_sess = tv_nexus->tvn_se_sess;
 
 		hash_for_each_possible_safe(fu->stream_hash, stream, tmp, node, cmd->tag) {
 			int i = stream - &fu->stream[0];
@@ -1357,6 +1395,7 @@ static struct usbg_cmd *usbg_get_cmd(struct f_uas *fu,
 	cmd->se_cmd.map_cpu = cpu;
 	cmd->se_cmd.cpuid = cpu;
 	cmd->se_cmd.tag = cmd->tag = scsi_tag;
+	cmd->se_sess = se_sess;
 	cmd->fu = fu;
 
 	return cmd;
@@ -1413,7 +1452,7 @@ static int usbg_submit_command(struct f_uas *fu, struct usb_request *req)
 		struct se_session *se_sess;
 		int i = stream - &fu->stream[0];
 
-		se_sess = cmd->fu->tpg->tpg_nexus->tvn_se_sess;
+		se_sess = tv_nexus->tvn_se_sess;
 		active_cmd = &((struct usbg_cmd *)se_sess->sess_cmd_map)[i];
 
 		if (active_cmd->tag == scsi_tag) {
@@ -1494,6 +1533,7 @@ static void bot_cmd_work(struct work_struct *work)
 		struct usb_gadget *gadget = fuas_to_gadget(cmd->fu);
 
 		dev_err(&gadget->dev, "Missing nexus, ignoring command\n");
+		usbg_cleanup_queued_cmd(cmd);
 		return;
 	}
 
diff --git a/drivers/usb/gadget/function/tcm.h b/drivers/usb/gadget/function/tcm.h
index 009974d81d66..1ae1f8383bd0 100644
--- a/drivers/usb/gadget/function/tcm.h
+++ b/drivers/usb/gadget/function/tcm.h
@@ -73,6 +73,7 @@ struct usbg_cmd {
 	struct work_struct work;
 	int unpacked_lun;
 	struct se_cmd se_cmd;
+	struct se_session *se_sess;
 	void *data_buf; /* used if no sg support available */
 	struct f_uas *fu;
 	struct kref ref;
-- 
2.43.0

