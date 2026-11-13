Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794555414;
	b=Ts7uHBuaKjeKTcOz+Vmufwn3pMg2LireEa6p23Uh+4nF1A1cGMSFM71FrKn0diB7gjYH
	 LtzHiWqhDBMnnWSXyym/PcdpnHgHYQhB65M836Ehx3X/mcL9DT/w19uWEncIx5kFx0xJW
	 KKZMcc8l6aoszEfXlM/kty18ASNyMVCCw9xpecCejtuyCPmzeoJvWZ9E2mcpWLq2Yh5PR
	 nz1F/ujkCLWaBRz2aOfdJMuB9XaGiLs6i7Zx0cuopNN9b5GKiehagYn8sAQiqJjxAfJWt
	 y2hp5tZeUdMN2aw2T/OdZqcbj7laCSrqpP78AVWg8yn6x9UuoHucUjxKr9BaO98flxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794555414;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mX97vKGfKG79Gv/YC4HRVZ42o6kQjjPD71aRf1vrpj4=;
	b=jc8iynF51HZzUF8BZ/+XRwvGLVOnlmXTxiTL66falDmwW7rI7Am7kgaivVxcl7ifQI8P
	 ig07TkycqQbhykSXPKsjaw+4rRWnJ/uLQQ8t6GTy9VAzKS0dsWGXEQFlLHhJOhP/TekOQ
	 ZOmtksOZbtoDYrqcSSlKTg9Pu+ifhmr42roPIJWUgKxNZAzP1pF5Efbi5S8cYNZOq6mUw
	 ThyBtUYaFw9MB2KKN4fGJ/WCqSnO8XQlUAj3Oyg24Vx+imJZN97cULNghn/QgALZrKD8J
	 62iPLHU/LV/MhNt6IPrKfKa7HXjV8CkPTIfuWOhmLCQPMLDc6xKiFU8hnFB7U6mPY9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4461D606A333
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 07:36:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4461D606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so917966a91.1
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 23:36:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794555413; x=1795160213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mX97vKGfKG79Gv/YC4HRVZ42o6kQjjPD71aRf1vrpj4=;
        b=GchVPEFVayz6IuIa/y2nZXiUJqns8qtgRo35fJeyUBoXoqEK2g6JjjGaMH9Tr7H547
         kglE6g2MN0gqoJA5SYmfrens4ewXtQMRq2B/wFwp/nD7IdoZxfQB0VPo9JHfsNZNwTSr
         0C4wLtrIPlRUGV5fi4bhKvnqSjeohhV3OtL1GdjepIxk6HqX3ovw7hLURJbdzVpVR+Et
         OYf1wVCaXn1fBFma/8oCrTc7Vk8LX2+yDyYR89yqb2LenvVmaxpYprljMVvHKNRIMjQL
         TTwq2ajUe+62RTIhEZvTbb0ZyEjbllyGdMOLytzVlSWIleSR7xPu3YahKRId7T/bKMWS
         kc8Q==
X-Forwarded-Encrypted: i=1; AL+hErFbr7ZtpoTveXoz1xswVOp6BIcRplpHkIiAX3xDnDgsRKcUWqFTcQJ12N2q5KVjCVQtRDOKIyvCCNI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qH1ZR8BIkhONA47NQzrxRsUsOZZ7SSCURYtiy6uNMmW4OTk6q
	IR7WyivZLU3odYJ2z/5A6WwZVAP8PxjFXrZLd5+SSZno659bsasgc3m5
X-Gm-Gg: AYBFou131zopVOJ+z1fo5EKxOX30yUZUCZU23efCIbnqmGwGl4qH65kZnKiDAAuFaxu
	5mBfQ9pWBY7DJ5IJhk9R8oV5jTdplYUAqZnpFC0tw1Hu3DGwI+w0fLb8w+Mk6uec0iMMYfGlQ2z
	RsYmC/gIW7IECs4/45LtH9M6i1lQas5HwKrkkdgorXsgMMXErABZ94jAKUx3kF4Q+L4E90Xexpt
	0UJkI/1SZOX4EqnJl56YK05MKlgSHW8w+a+dMHiLb5WkByeieu9eoe75FjmINInSVl1dMfNCEGm
	sBMnwh4imQZjaSGRZPQiSNywHQlSvrOXhLjtyr/cZd+9lL7ZfDLqMFSSh8+Ps4AD88IdA2/iZmS
	HNUP6DY2Lu5fnLBl/E3JtnsnW6H0WpUH+GnpIDvZOpFlLmpZj9s61fqqZOXZMJp6JREko6VTp6Q
	S4jdx+InxsoP6YJ/rawGH6ZreV3IhP97fdqojqGHFmSqfmhoNo/2vv1xDuceUhZ1C5PMPSj+qfY
	6OdobUaX7nUybZRmCIft77lc2r8wUQQWu4Pd0+Ug+edA/m0sdPsfrzrszoWbhG4hHehohEMK1+S
	bXz3hOQPLVNj74eafnJaTrWuVu3k5l9k/Mhmze/T6TFjzw==
X-Received: by 2002:a17:90b:57c3:b0:3ab:9c73:130 with SMTP id 98e67ed59e1d1-3b1b0a108e5mr1426110a91.33.1794555413550;
        Thu, 12 Nov 2026 23:36:53 -0800 (PST)
Received: from localhost.localdomain ([116.128.244.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aeb179fasm3205009a91.4.2026.11.12.23.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 23:36:53 -0800 (PST)
From: Hongyu Xie <xiehongyu1@kylinos.cn>
To: Alan Stern <stern@rowland.harvard.edu>,
	linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	usb-storage@lists.one-eyed-alien.net,
	syzbot+30552b4cbe99d6d91306@syzkaller.appspotmail.com,
	Liu Qi <liuqi@longcheer.com>,
	stable@vger.kernel.org,
	Hongyu Xie <xiehongyu1@kylinos.cn>
Subject: [PATCH v5 1/2] usb-storage: add usb_stor_bulk_transfer_buf_timeout()
Date: Fri, 13 Nov 2026 15:36:37 +0800
Message-Id: <20261113073638.1225998-2-xiehongyu1@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261113073638.1225998-1-xiehongyu1@kylinos.cn>
References: <b07b5f5b-4722-4f1c-84b9-205ba9b8943f@rowland.harvard.edu>
 <20261113073638.1225998-1-xiehongyu1@kylinos.cn>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

usb_stor_bulk_transfer_buf() waits for URB completion without a timeout.
That is correct for transfers belonging to a SCSI command, whose timeout
and abort handling terminate the wait, but not for transfers issued
outside a SCSI command.

Add a variant which takes a timeout, in jiffies; zero means no limit.
usb_stor_bulk_transfer_buf() becomes a wrapper with a zero timeout, so
existing callers are unchanged.

Signed-off-by: Hongyu Xie <xiehongyu1@kylinos.cn>
---
 drivers/usb/storage/transport.c | 31 ++++++++++++++++++++++++-------
 drivers/usb/storage/transport.h |  5 +++++
 2 files changed, 29 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/storage/transport.c b/drivers/usb/storage/transport.c
index 8de3015bce050..424293658918a 100644
--- a/drivers/usb/storage/transport.c
+++ b/drivers/usb/storage/transport.c
@@ -378,12 +378,17 @@ static int usb_stor_intr_transfer(struct us_data *us, void *buf,
 }
 
 /*
- * Transfer one buffer via bulk pipe, without timeouts, but allowing early
- * termination.  Return codes are USB_STOR_XFER_xxx.  If the bulk pipe
- * stalls during the transfer, the halt is automatically cleared.
+ * Transfer one buffer via bulk pipe, allowing early termination.  Return
+ * codes are USB_STOR_XFER_xxx.  If the bulk pipe stalls during the
+ * transfer, the halt is automatically cleared.
+ *
+ * A nonzero @timeout bounds the wait for URB completion, in jiffies.  It
+ * must only be used for transfers which are not part of a SCSI command:
+ * those rely on the command's timeout and abort handling.
  */
-int usb_stor_bulk_transfer_buf(struct us_data *us, unsigned int pipe,
-	void *buf, unsigned int length, unsigned int *act_len)
+int usb_stor_bulk_transfer_buf_timeout(struct us_data *us, unsigned int pipe,
+				       void *buf, unsigned int length,
+				       unsigned int *act_len, int timeout)
 {
 	int result;
 
@@ -392,14 +397,26 @@ int usb_stor_bulk_transfer_buf(struct us_data *us, unsigned int pipe,
 	/* fill and submit the URB */
 	usb_fill_bulk_urb(us->current_urb, us->pusb_dev, pipe, buf, length,
 		      usb_stor_blocking_completion, NULL);
-	result = usb_stor_msg_common(us, 0);
+	result = usb_stor_msg_common(us, timeout);
 
 	/* store the actual length of the data transferred */
 	if (act_len)
 		*act_len = us->current_urb->actual_length;
-	return interpret_urb_result(us, pipe, length, result, 
+	return interpret_urb_result(us, pipe, length, result,
 			us->current_urb->actual_length);
 }
+EXPORT_SYMBOL_GPL(usb_stor_bulk_transfer_buf_timeout);
+
+/*
+ * Same as usb_stor_bulk_transfer_buf_timeout() with an unbounded wait.
+ */
+int usb_stor_bulk_transfer_buf(struct us_data *us, unsigned int pipe,
+			       void *buf, unsigned int length,
+			       unsigned int *act_len)
+{
+	return usb_stor_bulk_transfer_buf_timeout(us, pipe, buf, length,
+			act_len, 0);
+}
 EXPORT_SYMBOL_GPL(usb_stor_bulk_transfer_buf);
 
 /*
diff --git a/drivers/usb/storage/transport.h b/drivers/usb/storage/transport.h
index 74ffd0d7e7b6c..361dbd77f15e3 100644
--- a/drivers/usb/storage/transport.h
+++ b/drivers/usb/storage/transport.h
@@ -77,6 +77,11 @@ extern int usb_stor_clear_halt(struct us_data *us, unsigned int pipe);
 extern int usb_stor_ctrl_transfer(struct us_data *us, unsigned int pipe,
 		u8 request, u8 requesttype, u16 value, u16 index,
 		void *data, u16 size);
+extern int usb_stor_bulk_transfer_buf_timeout(struct us_data *us,
+					      unsigned int pipe, void *buf,
+					      unsigned int length,
+					      unsigned int *act_len,
+					      int timeout);
 extern int usb_stor_bulk_transfer_buf(struct us_data *us, unsigned int pipe,
 		void *buf, unsigned int length, unsigned int *act_len);
 extern int usb_stor_bulk_transfer_sg(struct us_data *us, unsigned int pipe,
-- 
2.25.1

