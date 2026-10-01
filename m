Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7074C3F9287
	for <linux-usb@vger.kernel.org>; Thu,  1 Oct 2026 12:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790857998; cv=none; b=IQSEhInrwK1WkqciEbNMYQ02/Dg0ofz81ZOEa4b05k2ABTxhxEci+K6xwQ+L/SrcM2IY++phPRciu7quWNFt04Ey6fvcUSZOM5imiSUqMFdFZ+ReovYMF5Rp9EG113hIPrXkczHu1sabWhySjD3l+edC7vnc0AJbxeSsujBr7BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790857998; c=relaxed/simple;
	bh=+0Z9RNUYuQI0YF3Yzhv3v/KBNJUmhXnWTcQK4Lu5e5c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TmZilQIvYdq/BD8pCeVVuKd66yo+hGpcOIY3nBuzFvy4hYAnF02GXng2aXKVhJzanKtOHMM0cyWUHrz45Y0X/ZePZlJAlDTJKIhXHu3N1lrShSVJqlROLc1knCyTEeT8454eQ0PnLJQN6GRyhkmWwAcjhpu80Nq/fZH/mlzTC6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=npAtyUVQ; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="npAtyUVQ"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccb65437so3821179a91.3
        for <linux-usb@vger.kernel.org>; Thu, 01 Oct 2026 05:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790857997; x=1791462797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z5lqU5QsEffdFqz898X5GwASYkPwAXbDBRdKuSA3IbE=;
        b=npAtyUVQ1V4Q/yIFXel0QmOw9nYpSTgVZpZDLoN68aMbNl8FKp9Y6io/QYspVeULUC
         USJLPtcbLf5u4zEc088856JM9RxQ928axqKGdlW+llbDUpPSAsVhUqkmlKZrNv9evbBJ
         jZp0FNir158zU6+ISYF0kg3QIcXGU/LexXdsgFry3RQIqJh66GIBpYjiqlbRZVWGsuoD
         NJLQ6UYwEy9r8zLh55hNMTF53u5s70I/I8pHSk3TIx/qi/U5R1sN50j3Sg/tGYRfysNF
         GN5eErzq8cPuhweEvtH0LCB2q5Nn5mycFMPq4odjFUCzIZrejeBFeonEmTlp0olXbHPJ
         Ai3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790857997; x=1791462797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z5lqU5QsEffdFqz898X5GwASYkPwAXbDBRdKuSA3IbE=;
        b=LOPwum9AwWSV8VELnDxzDGI7DFesGRXTgOJ0Ptq5VfVwCa/aapJ0bv70sVmSJS5kgM
         SuogXIR3UiZuVjj35FOc2MG9jO2oPx2v2UpM6RiPj9pdHPG57EkFITIxlJgoInpNj8/1
         NnKbTPwmcTtbEOGiEoSUTmSF7tAe6Ud/IvrkV2O2Qg1PTLxPbD8/4iibwwcILFoPVO9P
         hKer0ALNj5EuPcD/XBl/qe0pW5+KqCCtl8kLC9baDT2/nxej5Ur7MkpUhDzLrfoLin6D
         UGrHmT8JOLvrTok+/PT/7/lwcGAOKBL3CtOj6qO4MS3wkRKupOFDEdV/1ZsCToioBFGs
         m2Xg==
X-Forwarded-Encrypted: i=1; AKwUvBw7/tmQy3l9s4Ils6VqlY43DxXE4iOpd76yrRVHLLykHUH3jLkFiAOZmmFiIwI2omLSRUg2GJo7uc8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJEzu0h9mTqhJ5kQLfXv7Dp1kNWMgmEHnxDFUJ7KXTy2b2m5/Nv
	FshXzDfT8ApIv6Z9F8yjkM+NiRg3cFVEeuYTUTSxZtEgDZbDi0Glr6bF
X-Gm-Gg: AYBFou2csOWprw/ZO0JKlh6q/zH05QkNx5xwqEd69tU/YCJTcueOmp624zIOTes9qzj
	7+NhHwJoAbaY2YSPp9nx+gOQ1zaTiWo8apcvD1wSQIvKfBeg3Rll1+VPAZPhut4PrMzdU4FWvpS
	jF2ci2JnzFP2gIx1g+zxZJdSEjns1XLzJkGrsTbeRg18MSJ0VjJiKL1d56hiSpDHvEQlSZBVjfX
	PzjtoAsLXQl7OEJ6Rtkr2s2EKrzmSEVvDhm0KGOkpvzCaa9alDZfDzoRVJKCAdQEjBcTx9wy2TC
	Uy7bC+IH+X/rQiIrZIhG3V+JTMD216UZITexIB+FCiM2eVGdgcCsCgwmOJFvfudYbsykt5gjH3T
	+XGR5t5l+KSrjeb3Mi1J6tO0e80MpnukfywGuQ4hgWsW6eJkxUwW6qs/lWxKcHDMNl1W2Zgc8SH
	5lZ+6pDL6qeGlR4Q5mdN5KjrkLtAFiKEIVA4EYzeC65R/jH13Ba9pgATwA6zf7pNCNHuf93XXzp
	umiiOwjwf6cPw8Ws5afp7BOUeQ8ou4NTHPeHpc=
X-Received: by 2002:a17:90a:508:b0:3a4:ee64:b82a with SMTP id 98e67ed59e1d1-3a4ee64d502mr1454410a91.11.1790857996554;
        Thu, 01 Oct 2026 05:33:16 -0700 (PDT)
Received: from localhost.localdomain ([2408:8352:470:235:7e7d:21ff:fedc:f409])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f478e750sm4464178a91.13.2026.10.01.05.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 05:33:16 -0700 (PDT)
From: xy521521@gmail.com
To: stern@rowland.harvard.edu
Cc: Hongyu Xie <xiehongyu1@kylinos.cn>,
	gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] usb-storage: ene_ub6250: fix coding style issues in the timeout code
Date: Thu,  1 Oct 2026 20:31:35 +0800
Message-Id: <20261001123135.38831-3-xy521521@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20261001123135.38831-1-xy521521@gmail.com>
References: <20261001123135.38831-1-xy521521@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hongyu Xie <xiehongyu1@kylinos.cn>

Fix the continuation-line alignment of the code added for the bounded
probe-time transfers and rename the fDir parameter of
ene_send_scsi_cmd[_timeout]() to fdir, as flagged by checkpatch.

No functional changes intended.

Signed-off-by: Hongyu Xie <xiehongyu1@kylinos.cn>
---
 drivers/usb/storage/ene_ub6250.c | 34 ++++++++++++++++----------------
 drivers/usb/storage/transport.c  |  9 +++++----
 drivers/usb/storage/transport.h  |  6 ++++--
 3 files changed, 26 insertions(+), 23 deletions(-)

diff --git a/drivers/usb/storage/ene_ub6250.c b/drivers/usb/storage/ene_ub6250.c
index 109336bd7e30..276764a66774 100644
--- a/drivers/usb/storage/ene_ub6250.c
+++ b/drivers/usb/storage/ene_ub6250.c
@@ -494,7 +494,7 @@ static void ene_ub6250_info_destructor(void *extra)
 	kfree(info->bbuf);
 }
 
-static int ene_send_scsi_cmd_timeout(struct us_data *us, u8 fDir, void *buf,
+static int ene_send_scsi_cmd_timeout(struct us_data *us, u8 fdir, void *buf,
 				     int use_sg, int timeout)
 {
 	struct bulk_cb_wrap *bcb = (struct bulk_cb_wrap *) us->iobuf;
@@ -508,17 +508,17 @@ static int ene_send_scsi_cmd_timeout(struct us_data *us, u8 fDir, void *buf,
 	/* usb_stor_dbg(us, "transport --- ene_send_scsi_cmd\n"); */
 	/* send cmd to out endpoint */
 	result = usb_stor_bulk_transfer_buf_timeout(us, us->send_bulk_pipe,
-					    bcb, US_BULK_CB_WRAP_LEN, NULL,
-					    timeout);
+						    bcb, US_BULK_CB_WRAP_LEN,
+						    NULL, timeout);
 	if (result != USB_STOR_XFER_GOOD) {
 		usb_stor_dbg(us, "send cmd to out endpoint fail ---\n");
 		return USB_STOR_TRANSPORT_ERROR;
 	}
 
 	if (buf) {
-		unsigned int pipe = fDir;
+		unsigned int pipe = fdir;
 
-		if (fDir  == FDIR_READ)
+		if (fdir == FDIR_READ)
 			pipe = us->recv_bulk_pipe;
 		else
 			pipe = us->send_bulk_pipe;
@@ -528,8 +528,8 @@ static int ene_send_scsi_cmd_timeout(struct us_data *us, u8 fDir, void *buf,
 			result = usb_stor_bulk_srb(us, pipe, us->srb);
 		} else if (timeout) {
 			result = usb_stor_bulk_transfer_buf_timeout(us, pipe,
-					buf, transfer_length, &partial,
-					timeout);
+								    buf, transfer_length, &partial,
+								    timeout);
 		} else {
 			result = usb_stor_bulk_transfer_sg(us, pipe, buf,
 						transfer_length, 0, &partial);
@@ -542,24 +542,24 @@ static int ene_send_scsi_cmd_timeout(struct us_data *us, u8 fDir, void *buf,
 
 	/* Get CSW for device status */
 	result = usb_stor_bulk_transfer_buf_timeout(us, us->recv_bulk_pipe,
-					    bcs, US_BULK_CS_WRAP_LEN, &cswlen,
-					    timeout);
+						    bcs, US_BULK_CS_WRAP_LEN,
+						    &cswlen, timeout);
 
 	if (result == USB_STOR_XFER_SHORT && cswlen == 0) {
 		usb_stor_dbg(us, "Received 0-length CSW; retrying...\n");
 		result = usb_stor_bulk_transfer_buf_timeout(us,
-					    us->recv_bulk_pipe, bcs,
-					    US_BULK_CS_WRAP_LEN, &cswlen,
-					    timeout);
+							    us->recv_bulk_pipe, bcs,
+							    US_BULK_CS_WRAP_LEN, &cswlen,
+							    timeout);
 	}
 
 	if (result == USB_STOR_XFER_STALLED) {
 		/* get the status again */
 		usb_stor_dbg(us, "Attempting to get CSW (2nd try)...\n");
 		result = usb_stor_bulk_transfer_buf_timeout(us,
-						us->recv_bulk_pipe, bcs,
-						US_BULK_CS_WRAP_LEN, NULL,
-						timeout);
+							    us->recv_bulk_pipe, bcs,
+							    US_BULK_CS_WRAP_LEN, NULL,
+							    timeout);
 	}
 
 	if (result != USB_STOR_XFER_GOOD)
@@ -589,9 +589,9 @@ static int ene_send_scsi_cmd_timeout(struct us_data *us, u8 fDir, void *buf,
  * Unbounded variant for command-path callers: the command's abort
  * machinery terminates usb_stor_msg_common()'s wait if the device dies.
  */
-static int ene_send_scsi_cmd(struct us_data *us, u8 fDir, void *buf, int use_sg)
+static int ene_send_scsi_cmd(struct us_data *us, u8 fdir, void *buf, int use_sg)
 {
-	return ene_send_scsi_cmd_timeout(us, fDir, buf, use_sg, 0);
+	return ene_send_scsi_cmd_timeout(us, fdir, buf, use_sg, 0);
 }
 
 static int do_scsi_request_sense(struct us_data *us, struct scsi_cmnd *srb)
diff --git a/drivers/usb/storage/transport.c b/drivers/usb/storage/transport.c
index c586d2021b7e..89619010d665 100644
--- a/drivers/usb/storage/transport.c
+++ b/drivers/usb/storage/transport.c
@@ -388,8 +388,8 @@ static int usb_stor_intr_transfer(struct us_data *us, void *buf,
  * machinery to terminate the wait.
  */
 int usb_stor_bulk_transfer_buf_timeout(struct us_data *us, unsigned int pipe,
-		void *buf, unsigned int length, unsigned int *act_len,
-		int timeout)
+				       void *buf, unsigned int length,
+				       unsigned int *act_len, int timeout)
 {
 	int result;
 
@@ -412,10 +412,11 @@ EXPORT_SYMBOL_GPL(usb_stor_bulk_transfer_buf_timeout);
  * Same as usb_stor_bulk_transfer_buf_timeout() with an unbounded wait.
  */
 int usb_stor_bulk_transfer_buf(struct us_data *us, unsigned int pipe,
-		void *buf, unsigned int length, unsigned int *act_len)
+			       void *buf, unsigned int length,
+			       unsigned int *act_len)
 {
 	return usb_stor_bulk_transfer_buf_timeout(us, pipe, buf, length,
-			act_len, 0);
+						  act_len, 0);
 }
 EXPORT_SYMBOL_GPL(usb_stor_bulk_transfer_buf);
 
diff --git a/drivers/usb/storage/transport.h b/drivers/usb/storage/transport.h
index dc0442efc24d..361dbd77f15e 100644
--- a/drivers/usb/storage/transport.h
+++ b/drivers/usb/storage/transport.h
@@ -78,8 +78,10 @@ extern int usb_stor_ctrl_transfer(struct us_data *us, unsigned int pipe,
 		u8 request, u8 requesttype, u16 value, u16 index,
 		void *data, u16 size);
 extern int usb_stor_bulk_transfer_buf_timeout(struct us_data *us,
-		unsigned int pipe, void *buf, unsigned int length,
-		unsigned int *act_len, int timeout);
+					      unsigned int pipe, void *buf,
+					      unsigned int length,
+					      unsigned int *act_len,
+					      int timeout);
 extern int usb_stor_bulk_transfer_buf(struct us_data *us, unsigned int pipe,
 		void *buf, unsigned int length, unsigned int *act_len);
 extern int usb_stor_bulk_transfer_sg(struct us_data *us, unsigned int pipe,
-- 
2.32.0

