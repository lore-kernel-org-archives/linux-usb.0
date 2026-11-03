Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793687393;
	b=TBlKCZf3jkA059Iqcu0+ISz/AijSecN3E1CzaUqV/jHs8Ivw2HdTBibxTOUPhnX9+EID
	 k1mfUvMA7T+NwFic5/n7E3XJqXUaJ6ehaJh9F9eI4rw1O2C0NBnE0h1IYnWEt1kHB2GKR
	 HCu5CI6jk892N7LcezX9Msz2r/eh8X5N4A2EANgncclLG9Lfy0p1yKZM9H1TIHlzFRru+
	 0EJOhOJfI9MHhjNGocJJbjJz5ulGmHcpx/YX9IQgRJta8sZLoN7kJUsiwtukqk6uRySH5
	 mIXM39Wi+Sx0vV8TyxUUPO2hNfTzR4RTJOOFwTK2bLhX4eAdmoRaRY+VgQDB0WODcxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793687393;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DlqRd2OswQ5wu8VHrHpo6vh4mLXNYer0je1L96tdIPw=;
	b=4wCzFonoJ+oCQAIV3lM/iSKw1vrEic+eKox3QCYWQa/sts/DcxkZ6JWYdWVjqsow5j6q
	 hOjmxTKSrMRB7EcHnMVTk7W9BUTKbYx0CagiwLB/SWW3Gfls6zbmwA/Btxaf8xy008JDu
	 xplJfUye4Uv59pq8RpcB08PhtzFFMa3UopQOKXC5xrpFQ8q5PKNsgu2zZnKYt1LUw+nwh
	 J5Ff3vsnvdpo7VTjMmeTGHMkDZhduj2J3TJjrpXIBz/vvGjpKEr5QXG1tyP9jl61aOLh0
	 +YVubATx1K0TQMFBPFBH3bvk0QOcialzPN3fVynfxq76uE6cBGuBnUCvLn4FNDyzl+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MEHsoiJW;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE5B606A324
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 06:29:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AE5B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MEHsoiJW
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1adbf62dd31so4142512c88.0
        for <linux-usb@vger.kernel.org>; Mon, 02 Nov 2026 22:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793687393; x=1794292193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DlqRd2OswQ5wu8VHrHpo6vh4mLXNYer0je1L96tdIPw=;
        b=MEHsoiJWEDS4Dzk7Wc4SeXmO11lW2V5Oqxt9ezfJSA4skiQn0KSvw9CV2yszdHV+kK
         CEiOJUO9cEQLam35aocWAO2w6vSg5l0yqzTQkmDgV2FwGm5y2K1fqEzQRionHPy/O3C5
         IiVMpPMg5T6T3SWpBIptICorHqZUyVxUBF1H8fzgb78dcsqoJCBvjhau6OmR5TGD++WB
         tOme0+MhKqr32PV4HqHjGjCD8taM2M6nid3NJ3fz4lwKCV6xFvvhIXP6TqFB53orTJH+
         iEHLzLEbbbVYTsPCNnGO3WYEF5WoGmJ4ZUPXmM7DfBQeHxwInwkOnCcjB37AmRNNP7yB
         Elew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793687393; x=1794292193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DlqRd2OswQ5wu8VHrHpo6vh4mLXNYer0je1L96tdIPw=;
        b=IJ+fB6nmva3wuqnJgIILuUU6CauIZy57veGWW2OS2jYTKULlGhKj23HjfgCmzWdrQ5
         5dE7Fmvn6M/dUslY9nb0Nbf1oWtEZUFwnfUxB6Emv5kfnPg3WityDiPXXLcp4WaeBSXn
         2769mH1QSBBPLLVtdf/E2iH///FKcsyNhbSRacP6wADorzjXuY6Yq+MmuWI+RAAaeBh7
         25xFkX6Ik8tRm1x6BvOBL+EU4CMOUmi/zZm+pa9Os25un3FN9C9kpNh5IJ0onRxF+VJg
         x7hC2LyGK4BofmXAVmdPKLAiLBz1ltP8EPV9SSc1053w6v5AzJBiYzZXsg6E5ZUbGXZF
         fOnQ==
X-Forwarded-Encrypted: i=1; AKwUvBxn9PSDwn4nfIHVf3jVOl5AVM5Ftf2xmE2oXw9nrZK+MmM3haLoQ7qjYlWggdklZKm0tQ35ZkhisUU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9S3bwGnTCBx8bpxKsj1EoN27CxHtwxJEvMu2glyaQvoCZWSMj8
	TMEDlUOKOqcJ1Bi6awFZd104W0yfS8yijh0so+OIKkAWqKT14HssX3Xo
X-Gm-Gg: AYBFou3KSjwosBHztm+Cvcn7+68+7uJkwGMJEUDoeprh4Dd5Lcsr2DWlh9/F6hapcgV
	KjryNQLxlg6gzthyFGc/3i7CMyDpwXgT4xdFqTlbnTSYQWZPX2OlEP1QNB3U67DpoVGcV48rEBq
	jVdKC0AIjyqda8HjclsC4A3ykSuiNGnaFPkW7mXJQLwLQKBZFofrfHrP6b/WU6Rnxi/Vdzy2Y3a
	WN5Hf1p7J7ImrclUB2hNziy/kMQjFt8z+5TpXGGaR394LV2aYAuvCuUtgXw9Sxx7iXvTbdQrj6L
	T8TtmmLYU2v7ldRrsgVbRwUAfpPmAma+YNGZADqta+ZUP07Nyqrr9yqYhempPITH6h7wxVRGlLy
	UUCsP/vV+Hy/yT5Jk4KHSwuj5SBJtzs/7Gqzw4ecGOaytpK/iPCJUDgc4j5PrqdeIt8zqcBwsQw
	pkwKGuVMb36qDFIub0I8vldGDLmS/RN7aPrJpZnJEwUqA76dBiMQ0IWEHWKQEq62fw38+C6MH10
	VQat+Nuur1W4gtK4jJn3Sh6zHfmeIwremwls3bKZMPqP1Gf6Ksz1tm9gyYiX+SNV6saFHdKlqQz
	9ZZLb3sOGVPOAYvXJgYWhuo70i8o7DX/xDUNptQ=
X-Received: by 2002:a05:7022:b0c6:b0:143:72b1:9004 with SMTP id a92af1059eb24-1ac5ecb37e9mr17812583c88.45.1793687392515;
        Mon, 02 Nov 2026 22:29:52 -0800 (PST)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19f4a04esm39366350c88.15.2026.11.02.22.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 22:29:52 -0800 (PST)
From: Priyanka Mani <priyankamani2100@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Neill Kapron <nkapron@google.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Priyanka Mani <priyankamani2100@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] usb: gadget: uvc: fix dwFrameInterval array leak on frame removal
Date: Tue,  3 Nov 2026 06:29:25 +0000
Message-ID: <7f7db2bcb2c5d248cf72a270bd18afc71cf01559.1793687064.git.priyankamani2100@gmail.com>
X-Mailer: git-send-email 2.43.0
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

uvcg_frame_dw_frame_interval_store() allocates the frame interval array
and stores it in uvcg_frame::dw_frame_interval. The array is only freed
when it is replaced by a later write to the dwFrameInterval attribute.

Frame items use the generic uvcg_config_item_release(), which frees the
frame itself but not the interval array, so the array is leaked every
time a frame directory is removed after dwFrameInterval was written.
This happens on every normal teardown of a configfs UVC gadget, and
kmemleak reports it as:

  unreferenced object 0xffff8881027f5040 (size 8):
    comm "uvc-frame-inter", pid 281, jiffies 4294827366
    hex dump (first 8 bytes):
      15 16 05 00 00 00 00 00                          ........
    backtrace (crc 60980708):
      __kmalloc_noprof+0x4ca/0x7a0
      uvcg_frame_dw_frame_interval_store+0x299/0x440 [usb_f_uvc]
      configfs_write_iter+0x2ac/0x490
      vfs_write+0x60f/0x1100
      ksys_write+0xf9/0x1d0
      do_syscall_64+0xfa/0x5e0

Give frames their own release callback that frees the interval array
together with the frame.

The leak was found with kmemleak while exercising configfs gadget
functions in a VM.

Fixes: 46919a23ee87 ("usb: gadget: uvc: configfs support in uvc function")
Cc: stable@vger.kernel.org
Signed-off-by: Priyanka Mani <priyankamani2100@gmail.com>
---
 drivers/usb/gadget/function/uvc_configfs.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/uvc_configfs.c b/drivers/usb/gadget/function/uvc_configfs.c
index 70a1415ea401..48105b36dbfa 100644
--- a/drivers/usb/gadget/function/uvc_configfs.c
+++ b/drivers/usb/gadget/function/uvc_configfs.c
@@ -2142,14 +2142,26 @@ static struct configfs_attribute *uvcg_frame_attrs2[] = {
 	NULL,
 };
 
+static void uvcg_frame_release(struct config_item *item)
+{
+	struct uvcg_frame *frm = to_uvcg_frame(item);
+
+	kfree(frm->dw_frame_interval);
+	kfree(frm);
+}
+
+static const struct configfs_item_operations uvcg_frame_item_ops = {
+	.release	= uvcg_frame_release,
+};
+
 static const struct config_item_type uvcg_frame_type1 = {
-	.ct_item_ops	= &uvcg_config_item_ops,
+	.ct_item_ops	= &uvcg_frame_item_ops,
 	.ct_attrs	= uvcg_frame_attrs1,
 	.ct_owner	= THIS_MODULE,
 };
 
 static const struct config_item_type uvcg_frame_type2 = {
-	.ct_item_ops    = &uvcg_config_item_ops,
+	.ct_item_ops    = &uvcg_frame_item_ops,
 	.ct_attrs       = uvcg_frame_attrs2,
 	.ct_owner       = THIS_MODULE,
 };
-- 
2.43.0

