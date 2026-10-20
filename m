Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792473573;
	b=Jx5SWi28IP46xMJoHFnoDkGI/yoj5IWbDCdOwQvAm8tLhGlnPuQrCSUqgHKy2wrpQ1uJ
	 OxVjtPtYkLEmUpQFkY8/4GdO2Wc+mo7GTfrXVb3PK4XOjp5vt9AUk2522iNGvqWPXdn3V
	 TE1Wqq3lpPqlgy941gZpQkwcfSLdJ4Q+Yu7oQaH+QEMigw9qvq0LWqUNZR7rBCb7q3xSY
	 BxSMnhwrOv+W6B6EaHWYeycK7GSvw3t1eF7gMV1InDD9x3CLnbECs8/bfpNQcZ8QsJ2x6
	 DLRLLi4pnuesaUyXwrydTM+VAz2DI7cb2burQBWW8ORrdcuMvNb73SLKWL+PICBeCcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792473573;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=WiwuSh+FB4wlU3qM122kTHIbF58w/uDaDwSp2c2z4b8=;
	b=RjtcDAvSZCnus9xuD3fFdz8Z8w0MIzayV7uYX+xRKUjkE1UAWrgCMDbgoNkMGNo/9Ab5
	 QBWU2mZAFCzozybdNYKC9gmLe1a724hMS9jw69j7k9bf4zfpI4yoABmMFrbf8+0InLXyN
	 Qou+cgMvAxQu6aixansK0+4yi/fBLTEdT8HW9BkU7Aql7WdR6OFgPzFK6t/Oq8QIU/e/d
	 9Av74MZfoLcEXt/SXjT6yQun5VfoIlNdRBBPEc0CGrGT/KytTeBtjlQmArPyJ88sK3Owh
	 cHx1wZdbv+2/SKIxE3Xar3GNFkBFdZZUqRYCCLYH9UVKUlM0mR8bRFUd/vhQr44R6sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BlmUULdJ;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516BC606A319
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 05:19:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 516BC606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BlmUULdJ
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e8da6ef7ddso14069445ad.3
        for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 22:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792473573; x=1793078373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WiwuSh+FB4wlU3qM122kTHIbF58w/uDaDwSp2c2z4b8=;
        b=BlmUULdJDtjKoJrEy8yAl3GreePE+o+r052NwAx8OHhqdzSv+OPzw/a8/ZsqaYvDLo
         F4NIR/R3OH7fjK20x4vZpDatoTxUBbt+XpRYubWrKMTG45tAwqwMipIS5tHVzETdPHih
         CqaQo3p/zIKLd2qmENh4rZlUapJeedpnS8hp5rDMHyc3o2ztD3IanpKR6W0AqOlC9oRe
         M6lMUsGl+aOcS+YoSwYHiY0GzbtOFQ5P+h8ESYzLbvU5GqzJMAdJMA1x4sCliRmYQtiR
         z7gpvI36Q8tDTBzIlTPaSSQ85+fArfpAXjRsSd2GrqkIHoGAoNigK9euCz08Xbv02m1S
         pJFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792473573; x=1793078373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WiwuSh+FB4wlU3qM122kTHIbF58w/uDaDwSp2c2z4b8=;
        b=rPIi0vOA3qN9jVTtRzTTfarSZEgqmrxIJqkEO/UR9wxEerVky45nYbXwGfWdvZ2+Fl
         rA5jyQNN8GSqM7gUgzM/i6JJPBKF8emAcmfdP+OvOC/h4mG2pOsd256T7wbDr0J8sM2s
         qFRJpDUyuDvqy6toJtooVFiIOnRqQifqTRY0UFJJn3Iaer9rz4p3qqLY6ZzQzVNXvPiD
         DZtz8GXNtnvWa6s/SpgwVbg0XeL7Yck12NGZkoGoJXHxnUYst0UXPgQWBWj2ZyIOom02
         q7WiW7qvzAKn6qfpkMkWbB3TJApX0XgyuDWzYsLOwHoo7Ob3tccvgS5r6oDPjMOo0Y7D
         xrCg==
X-Gm-Message-State: AFq9FYJsQ6Zc6ecXufWFbFm3DSN8ork4SyyKoLrw5P80gdOyNcK4B1x3
	ZvDF0ykp+GzBvQMG23NaZml5340NdGK4zJPHr4qGnYjLfQdrIyRBUgkW
X-Gm-Gg: AYBFou1I9dqytDp1+FfxZiZNb4uqKxLXtzZeEQPYSHauKCLbkBZoOJY+rRMSyZgsGDJ
	cYTJWgty8F6xOT440/TOTwHbeG0JUjtj0QupLtUrOPmVt+p20J0/XZFmu8MjL/LTZHFG3Exf/Di
	YvFtHpRyYbM6/Ceg9afgbJo37B9oDkeFLyt4c9fx16zvEH8XhblELhcNn9K81GGuKTyZDn1jCEY
	2x7aG/POOOJD70adiAVuWSjPSywo4ucGm4E5jvLZYQcEty4ygNZdu3NNKxhhwIK/gn3HrsfV/n8
	NVcrU3jv3zoAOijn8tGD8bQZhybrKyn4GWJDDb8DCkV+Jq09FNVqULLZkjcmrttqMjZGFBQmU9l
	4pyE3XGHw8dNt+pwcm9Hf2PqlFy/BpQ30gVOToDXOsbVgmj+bdgfcYEuXB5erE2CPxGqkOA7mxF
	U1N1RLaVnnadopfcblp66TraVo6O0R16O+DjySPkzfLs67fGVEh6rFgA7c5kjCluvuoxDLjkwks
	M7AMSw1Vv1KUHi1V9XUNmIaQk0cdwVxlqMrEox+XSZsryxm2EpL4HtH97aXk0nLxZTW3SWAzbZH
	ORZv9ibmPhFkGTSE4ds94/1PHc32cOp9EkA+O0V0LCKYfRcMwT9DfqBjeVF91osG1/VUbKZV5Of
	VTMpPhQn2dCeVldfTAMxwZtr57jT3IA==
X-Received: by 2002:a17:903:2c8b:b0:2e9:5c55:c46a with SMTP id d9443c01a7336-2e9a6834a18mr82663075ad.7.1792473572624;
        Mon, 19 Oct 2026 22:19:32 -0700 (PDT)
Received: from EAIT-H54D9Q2FJQ.eait.uq.edu.au ([130.102.10.249])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea145af6c5sm8940965ad.2.2026.10.19.22.19.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 19 Oct 2026 22:19:32 -0700 (PDT)
From: Yu Zhang <yuz08559@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yu Zhang <yuz08559@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] usb: gadget: f_fs: check ffs->gadget in the DMABUF detach/find paths
Date: Tue, 20 Oct 2026 15:19:25 +1000
Message-ID: <20261020051925.92294-1-yuz08559@gmail.com>
X-Mailer: git-send-email 2.55.0
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

ffs_dmabuf_detach() and ffs_dmabuf_find_attachment() dereference
ffs->gadget->dev.parent as their very first statement, without checking
that ffs->gadget is non-NULL:

	static int ffs_dmabuf_detach(struct file *file, int fd)
	{
		...
		struct device *dev = ffs->gadget->dev.parent;

ffs->gadget is only set between functionfs_bind() and
functionfs_unbind() (UDC bind/unbind). The epfile ioctls, however, are
gated only on ffs->state == FFS_ACTIVE, which userspace reaches by
writing the descriptors and strings and which is independent of the
gadget lifetime: an FFS instance is FFS_ACTIVE before it has ever been
bound to a UDC, and stays FFS_ACTIVE after unbind. So
FUNCTIONFS_DMABUF_DETACH (and the DMABUF transfer path, through
ffs_dmabuf_find_attachment()) can be issued while ffs->gadget is NULL,
dereferencing NULL:

	BUG: kernel NULL pointer dereference, address: 00000000000000b0
	RIP: 0010:ffs_epfile_ioctl+0x402/0x1700
	 __x64_sys_ioctl+0x120/0x170
	 do_syscall_64+0xf9/0x540

Reproduced by mounting functionfs, writing a descriptor+string blob so
the state becomes FFS_ACTIVE without ever binding a UDC, then issuing
FUNCTIONFS_DMABUF_DETACH on an endpoint file.

ffs_dmabuf_attach() already guards this with
"if (!gadget || !gadget->sg_supported) return -EPERM". Do the same in
ffs_dmabuf_detach() and ffs_dmabuf_find_attachment() (the latter also
covers ffs_dmabuf_transfer()): snapshot ffs->gadget, return -EPERM if it
is NULL, and use the snapshot.

Fixes: 7b07a2a7ca02 ("usb: gadget: functionfs: Add DMABUF import interface")
Cc: stable@vger.kernel.org
Signed-off-by: Yu Zhang <yuz08559@gmail.com>
---
 drivers/usb/gadget/function/f_fs.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 44218be..0976db7 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -1473,9 +1473,15 @@ static int ffs_dma_resv_lock(struct dma_buf *dmabuf, bool nonblock)
 static struct dma_buf_attachment *
 ffs_dmabuf_find_attachment(struct ffs_epfile *epfile, struct dma_buf *dmabuf)
 {
-	struct device *dev = epfile->ffs->gadget->dev.parent;
+	struct usb_gadget *gadget = epfile->ffs->gadget;
 	struct dma_buf_attachment *attach = NULL;
 	struct ffs_dmabuf_priv *priv;
+	struct device *dev;
+
+	if (!gadget)
+		return ERR_PTR(-EPERM);
+
+	dev = gadget->dev.parent;
 
 	mutex_lock(&epfile->dmabufs_mutex);
 
@@ -1570,11 +1576,17 @@ static int ffs_dmabuf_detach(struct file *file, int fd)
 {
 	struct ffs_epfile *epfile = file->private_data;
 	struct ffs_data *ffs = epfile->ffs;
-	struct device *dev = ffs->gadget->dev.parent;
+	struct usb_gadget *gadget = ffs->gadget;
 	struct ffs_dmabuf_priv *priv, *tmp;
 	struct dma_buf *dmabuf;
+	struct device *dev;
 	int ret = -EPERM;
 
+	if (!gadget)
+		return -EPERM;
+
+	dev = gadget->dev.parent;
+
 	dmabuf = dma_buf_get(fd);
 	if (IS_ERR(dmabuf))
 		return PTR_ERR(dmabuf);
-- 
2.43.0

