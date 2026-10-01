Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1AB485920
	for <linux-usb@vger.kernel.org>; Thu,  1 Oct 2026 07:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790841534; cv=none; b=c3h7zdltZa3Rk+/s2lBF90IlrOXo7l5YPLxMv1I8q0w4Xdcw+PJD0mEa83FNfExEy/CVwvO3WSQdTewVu0v0oVIDrzRCye8QV4hx4XMsRMTlzxUnt1R6JqL7YhJ8eUKNX77ekh+AsaHWc2h+82O1zGTr+E3bjJI4OlWVzR1978A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790841534; c=relaxed/simple;
	bh=o4WRSh3ylU4jB+2m7Tsef/0w3oHGjiMTYD7zQ1XHpOk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eHaQO1Ns9Gisq+qBqe2VbOqc1zBKEhwLZ4+5PSXiomsYgwdg9YHyf0dYgAWVibaZu8jsRBcWD0hKHmk04IH7K5TQ1H56c7MvVQmWpCHgUvIkZzQ2tIQ8yVcsgVsVb7TXo033j4JhhhCLCh2jjJ0UVMPeQOhOzMUgT4eLm1ZbB0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cLTKOCzk; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cLTKOCzk"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33bfb26865fso6134443eec.2
        for <linux-usb@vger.kernel.org>; Thu, 01 Oct 2026 00:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790841529; x=1791446329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CwXOGWnaQ6wHI28E3mJBgUO/SJXhASkewtrPuNOpg4M=;
        b=cLTKOCzkP3z6SUOoxqjvWNwL+CXey+MFpnkAtuwCcKErzjQ//5OYahx7SoG2znul91
         kp9dIPWLY+GpVjQQHEjnGIbq4/KKvuyAJFeakKuBKL9zhtPjDa/RqL3WnRZHNY4aJ2CO
         xCNv0BcZ3//CMbuZ/nyQKH1OkqzBAGdUHoIKH58ZW38Nfv4iyWeAFNPiHUt+44+9lqni
         /osEwz5xfOVx4XWhpeSlTUEA9gyLKqAOBs4cKmrqeO2NMEbTDWggW+ifhgnioBsP7e9R
         a8rLdDfUSh6Xjz4slg1d8MCsF/VVrpo1194T7x8tFdQb23IjO2NMM77PgDB5L0i5oWeV
         7Cmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790841529; x=1791446329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CwXOGWnaQ6wHI28E3mJBgUO/SJXhASkewtrPuNOpg4M=;
        b=zGho1NaUetUahMx3rX0yEBE3EsBnOMeyEFSstzBEHoUaHKTDV4b6eRKfJKwqtRsdUN
         PAMBRdMep5FzhjwnmOCUy+AfxU5ZVsiD6zCGwxaIo26O02iWGgIC8I4k8VSC8ev2caGU
         t7KHhZYxxKuO5PVhCGxeBGx+PGL+f6pXZIi6sTNQU/qpJbPhDCkpSa9i5EqAOXMGTbcg
         88ku337qITGyEQ1nPL1LJASNVeji713Ns7zlhKQQXpdTlXqw7+3+qhdBNnSKrAL1Xths
         7+GMXz2nKbO0bZouq/avGBZpz3ra/sJp1L2z/d5sJstwJO1EjBqXCQ463DH3FR3hFXXB
         ouag==
X-Gm-Message-State: AFq9FYIgcwv+rPWZZTSCsSXtnZM8mwZDuro8I3ZCYOEAh1975HpiWUD7
	Y9p92MQYeXfiur7JFNP2Z3lbWmt/iE0xfzeSi0OC/uek98TUIWVZ2FACVlnCIA==
X-Gm-Gg: AYBFou3shcvgqlRTTAaWKfDaN8qAhx5TtKSx+Rwxo/vxu4o/y1oLVYQYa2NALvvprdc
	9qOrP5lpChZPFBhRG5KkX5ANDOL0z8ytjk4QzEbExHFpl3ZsAUO3S2lloLk7Y9VYYdvWznMI5jb
	hblSEywtxT1vsmZCo2feZKEBoeysjQwEff6ezOn+khhfsSueQAxVtqwaAF084/c2pOv9cpbFUVd
	ykhqtqCs2Y0uihrS9cP911LoUvYT9xnEXXdjFBO8J4kLN9a6xWLgkYjoCUV2JZhT/smJuzUcVNb
	D/HIANGh0K3SRm8Qclc2n2521JYwBcxu/jOrZKMrBX38IoDFqGs910qNczZQl0LXIHsTqA8EjCR
	Hlmf4tqJUAzWk50yvvaqrKtrhcma5tKH6uNcatDvvzaq37c6yUazyJ7F40TCaOqd+dBbcDQYpOi
	T8AiDmzdcWRBYeqpUmHCv/6b5s4KC/zP0MoCSZW4X1ZAkmcPP6Mj7rYXWl9Pw8TSWEzLU4GJLLa
	nWTTxnreh4=
X-Received: by 2002:a05:7300:6902:b0:33c:e82:70c7 with SMTP id 5a478bee46e88-34cdcdb285dmr5181331eec.30.1790841528992;
        Thu, 01 Oct 2026 00:58:48 -0700 (PDT)
Received: from yocto.amd.com ([165.204.156.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34db4d1d560sm5174829eec.29.2026.10.01.00.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 00:58:47 -0700 (PDT)
From: paritoshpotukuchi@gmail.com
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	syzbot+debc5c305403f180c01c@syzkaller.appspotmail.com,
	Paritosh Potukuchi <paritosh.potukuchi@amd.com>
Subject: [PATCH] usb: gadget: f_uac1: fix ac_header_desc in descriptor lists
Date: Thu,  1 Oct 2026 07:58:08 +0000
Message-ID: <20261001075808.2156188-1-paritoshpotukuchi@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paritosh Potukuchi <paritosh.potukuchi@amd.com>

ac_header_desc is a pointer to a dynamically allocated
uac1_ac_header_descriptor. The descriptor lists incorrectly
store &ac_header_desc, which is the address of the pointer
variable rather than the descriptor itself.

usb_copy_descriptors() interprets entries in these lists as
USB descriptor headers. As a result, passing
&ac_header_desc causes the pointer variable itself to be
interpreted as a descriptor and can lead to out-of-bounds
memory accesses.

Store ac_header_desc instead of &ac_header_desc in both
f_audio_desc and f_audio_ss_desc.

Fixes: 0591bc236015 ("usb: gadget: add f_uac1 variant based on a new u_audio api")
Reported-by: syzbot+debc5c305403f180c01c@syzkaller.appspotmail.com
Link: https://lore.kernel.org/all/6a68b182.4c659fcc.19cd90.0021.GAE@google.com/T/

Signed-off-by: Paritosh Potukuchi <paritosh.potukuchi@amd.com>
---
 drivers/usb/gadget/function/f_uac1.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_uac1.c b/drivers/usb/gadget/function/f_uac1.c
index 7a81cd176abd..94cc90389f6a 100644
--- a/drivers/usb/gadget/function/f_uac1.c
+++ b/drivers/usb/gadget/function/f_uac1.c
@@ -260,7 +260,7 @@ static struct uac_iso_endpoint_descriptor as_iso_in_desc = {
 
 static struct usb_descriptor_header *f_audio_desc[] = {
 	(struct usb_descriptor_header *)&ac_interface_desc,
-	(struct usb_descriptor_header *)&ac_header_desc,
+	(struct usb_descriptor_header *)ac_header_desc,
 
 	(struct usb_descriptor_header *)&usb_out_it_desc,
 	(struct usb_descriptor_header *)&io_out_ot_desc,
@@ -332,7 +332,7 @@ static struct usb_ss_ep_comp_descriptor ss_as_in_ep_desc_comp = {
 
 static struct usb_descriptor_header *f_audio_ss_desc[] = {
 	(struct usb_descriptor_header *)&ac_interface_desc,
-	(struct usb_descriptor_header *)&ac_header_desc,
+	(struct usb_descriptor_header *)ac_header_desc,
 
 	(struct usb_descriptor_header *)&usb_out_it_desc,
 	(struct usb_descriptor_header *)&io_out_ot_desc,
-- 
2.55.0

