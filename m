Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794538171;
	b=yFjWxnuE/OAE0a/75t7++ebFstoA3C85q2Fw1OqjxK/JA/dHz3VNPmT5s/nVEtk8/j0R
	 pLBDSs3QsX1H/QMVDCxye5xQ9MRXW6GF8ZKlEIQTWyCDHDsmJKQWUfl7boWFinNfeuZlp
	 8yfIGJ1VmYF/1bnAjaHrdzLth+KrkMyX/xE2+6azud/mHOFw7rYRQ47I57dqnpuQQ+ueP
	 EmYScpTcpCDrV1YkRFY4tRtBXjpXzrt0B3/lh15vMjh1q7n9xT+TEg4+koWiPPXXhO1c0
	 coxIIO3bHnTLC1BGydPnxhzLzhWa+UO9Iom2poHMYRUT+MyhIYSzrhP6iVG4VhImM5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794538171;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=ChnlpzcFOrMr7HW4C/J+k+WmZgfub9wZerAn0LJPSow=;
	b=fjsVW2XYm2Ec2nAhH3lFHREu1vP2LNz52NIzpwgPy45fglGgR0AoDIulr6XvtJvy0CWK
	 x52iH6GM5mAfA92Xoz6i51E/dR0WzsaD+mx6Eny/TksPRCpkAjnZ96Z6P4x53/LgI6zJv
	 e1ND/b7yBv4SKfFTk/BlGeYmIoN1B3Uj8v4YBKTWXO1FRkVR3L8eYJQuJe3YDjlOcDao7
	 ZOjJeZ7ePQANpaFXeb3tbjVYesiGYHP5xJyLcAp4ZdTev+t25haUqXrPN+H7eipPmbjZN
	 Eu2A713BqrljB+wjBuNiXxGvICJHThPkop7pGbyuk/6dXis9w8YzoRnvLG8+MhfPDcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--sarthakkukreti.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VL2l4eXK;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AC2606A886
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 02:49:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24AC2606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sarthakkukreti.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=VL2l4eXK
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-375f0fd31f4so607863eec.0
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 18:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794538170; x=1795142970; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ChnlpzcFOrMr7HW4C/J+k+WmZgfub9wZerAn0LJPSow=;
        b=VL2l4eXKYlAI3RV73l8gTjZeon2l4NMczG6KQHDOOPh1X+3ORCFIFfzUYZIbMk+o26
         wVo3xGZA05LfrbiRPKzvA4P+gR6Z4mbKyNl7XE8K/Db75veRVWsYMVvOTfKHXB2hz5uQ
         OB6TLPvAdNV25LbF4Qf9NhNxG5yrNMx3myv/DucUqZzIQ+njGNLhBLfRNbEsakaSYInX
         HWEz8WoFOAp1PAPBrUz3CjcqvfvpdsL4iRfvmUDl2D42VXWJw/jowRbo1Os9Hx+QZHaK
         KGFTcnOBHuAqkTTE7Hygs6VRWwmn4lmsgSCPXQUrZdlAuwuT890dW80szaVeTr4VqAJr
         YJEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794538170; x=1795142970;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ChnlpzcFOrMr7HW4C/J+k+WmZgfub9wZerAn0LJPSow=;
        b=RaOlXw/vj8l2ZVK+r/S29ytZ2aSuMfL0zCPvji6PbWnL8Yx1RgdrS2XZhXzyQ3Xl6A
         AoOMwaBNVh97uD+WVvbKNn1S0W6qyMQj0GotYnXZ8HXn7N3FaeJw8e4/l2SDro+pWw6p
         HCu6/MtHKNkn6AkvNcsQkZC0SY5Oefu7PZS/iec3eJCAncl+eBrMR9id10PxmsOe3l90
         tVe+tQHTTueHq7A14nl3n1CVcopDu8EeDPuXcPq1+XYlhlpgGgqP3ih/vgLB1Rn81nBs
         zsCNyg52Goy4aP2Q6XX6lyXBbc7y3kW3VWWXrdTLLyWqsL+rRFAHz3xxaW2tDaX4DJ6W
         ZU8A==
X-Gm-Message-State: APuU4Z/aIUr0SW2llR1YAopoOkkzxY3ZpZ5HDpjMuvMrEJth5iONVZDW
	7zPVd01n8ElLkqjHWi+XtdA6Zo5UaUu3+qfVei1nNqVTdxf2Tx+GG1QdP1KB7i+cTNg5Xs6kOfa
	VLvIDf9X9VXZoAn5bRNtkDjO/jdZSBj2fusqHOA==
X-Received: from dycok10.prod.google.com ([2002:a05:7301:db0a:b0:351:4a2a:1ece])
 (user=sarthakkukreti job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:4348:b0:36c:9d4c:6465 with SMTP id 5a478bee46e88-379675fea05mr1468375eec.24.1794538169823;
 Thu, 12 Nov 2026 18:49:29 -0800 (PST)
Date: Thu, 12 Nov 2026 18:49:20 -0800
In-Reply-To: <20261113024922.27977-1-sarthakkukreti@google.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113024922.27977-1-sarthakkukreti@google.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261113024922.27977-3-sarthakkukreti@google.com>
Subject: [PATCH v2 2/3] usb: uas: fail command submission on fatal USB errors
From: Sarthak Kukreti <sarthakkukreti@google.com>
To: Oliver Neukum <oneukum@suse.com>, Alan Stern <stern@rowland.harvard.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, 
	"Martin K . Petersen" <mkp@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sarthak Kukreti <sarthakkukreti@google.com>
Content-Type: text/plain; charset="UTF-8"

uas_queuecommand_lck() only treats -ENODEV from uas_submit_urbs() as a
fatal submission error. When a link drops or an endpoint is disabled
while hub_wq is frozen, usb_submit_urb() can also fail with -ESHUTDOWN,
-ENOENT, or -EHOSTUNREACH, causing uas_queuecommand_lck() to return
SCSI_MLQUEUE_DEVICE_BUSY or queue retry work. In addition, if status or
data URB submission succeeds before a later URB submission fails,
uas_queuecommand_lck() either leaks unsubmitted URBs and orphans the
status URB, or leaves SUBMIT_CMD_URB set and COMMAND_INFLIGHT clear so
the command never completes.

Fail commands with DID_NO_CONNECT on -ESHUTDOWN, -ENOENT, and
-EHOSTUNREACH in uas_queuecommand_lck(), free unsubmitted URBs, and
unlink any already-submitted status or data URBs outside devinfo->lock.

Fixes: 26d56a9fcb20 ("usb: uas: fix urb unmapping issue when the uas device is remove during ongoing data transfer")
Signed-off-by: Sarthak Kukreti <sarthakkukreti@google.com>
---
 drivers/usb/storage/uas.c | 48 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 42 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/storage/uas.c b/drivers/usb/storage/uas.c
index 904b4ce04fc6..951d85b2e7ac 100644
--- a/drivers/usb/storage/uas.c
+++ b/drivers/usb/storage/uas.c
@@ -756,12 +756,49 @@ static enum scsi_qc_status uas_queuecommand_lck(struct scsi_cmnd *cmnd)
 	 * a command that has finished is a success for the purpose
 	 * of queueing, no matter how fatal the error
 	 */
-	if (err == -ENODEV) {
-		if (cmdinfo->state & (COMMAND_INFLIGHT | DATA_IN_URB_INFLIGHT |
-				DATA_OUT_URB_INFLIGHT))
-			goto out;
-
+	if (err == -ENODEV || err == -ESHUTDOWN || err == -ENOENT ||
+	    err == -EHOSTUNREACH) {
 		set_host_byte(cmnd, DID_NO_CONNECT);
+		uas_free_unsubmitted_urbs(cmnd);
+		if (cmdinfo->sense_urb ||
+		    (cmdinfo->state & (COMMAND_INFLIGHT |
+				       DATA_IN_URB_INFLIGHT |
+				       DATA_OUT_URB_INFLIGHT))) {
+			struct urb *sense_urb = usb_get_urb(cmdinfo->sense_urb);
+			struct urb *data_in_urb = NULL;
+			struct urb *data_out_urb = NULL;
+
+			if (cmdinfo->sense_urb)
+				cmdinfo->state |= COMMAND_INFLIGHT;
+			if (cmdinfo->state & DATA_IN_URB_INFLIGHT)
+				data_in_urb = usb_get_urb(cmdinfo->data_in_urb);
+			if (cmdinfo->state & DATA_OUT_URB_INFLIGHT)
+				data_out_urb = usb_get_urb(cmdinfo->data_out_urb);
+			cmdinfo->state &= ~(SUBMIT_STATUS_URB |
+					    ALLOC_DATA_IN_URB |
+					    SUBMIT_DATA_IN_URB |
+					    ALLOC_DATA_OUT_URB |
+					    SUBMIT_DATA_OUT_URB |
+					    ALLOC_CMD_URB |
+					    SUBMIT_CMD_URB);
+			devinfo->cmnd[idx] = cmnd;
+			spin_unlock_irqrestore(&devinfo->lock, flags);
+
+			if (sense_urb) {
+				usb_unlink_urb(sense_urb);
+				usb_put_urb(sense_urb);
+			}
+			if (data_in_urb) {
+				usb_unlink_urb(data_in_urb);
+				usb_put_urb(data_in_urb);
+			}
+			if (data_out_urb) {
+				usb_unlink_urb(data_out_urb);
+				usb_put_urb(data_out_urb);
+			}
+			return 0;
+		}
+
 		scsi_done(cmnd);
 		goto zombie;
 	}
@@ -774,7 +811,6 @@ static enum scsi_qc_status uas_queuecommand_lck(struct scsi_cmnd *cmnd)
 		uas_add_work(cmnd);
 	}
 
-out:
 	devinfo->cmnd[idx] = cmnd;
 zombie:
 	spin_unlock_irqrestore(&devinfo->lock, flags);
-- 
2.56.0.611.g1030f0b940-goog

