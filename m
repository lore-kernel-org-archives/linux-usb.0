Received: from mail-oi1-f202.google.com (mail-oi1-f202.google.com [209.85.167.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DCF7322B72
	for <linux-usb@vger.kernel.org>; Fri, 19 Jun 2026 04:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781841991; cv=none; b=DxfoAALMxdzvTPNcHozUYVWxtsHdxkE/2rx+RYKg3BceIiwPO8h/zfQfvz42KERovAk3hIBnJt8Hv0oDEG8Quy6Wf7jTvlJo7oRFhdovvlzYuh5kNkB0WVLzwt7B9LuFWHg2YIDhMFL1ilNZ1HaLTxf5XiS9QpgBKZJI9LYwZ0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781841991; c=relaxed/simple;
	bh=YrJizVXLfuOEqkUomNiZSsMQZbHBHINC9DMoRg69K9I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hEt5snGm55O/eno/XiDblkbnedLzLc/JUaOBFoME1XWUmD3kN0etU/cQeqj7hqHr5M0SOX05mdREQbJGcheFcgFIpjVw5jB9q1jMf57z5RH3KrwjyYsH2/w4qVxShQfRntFd6/3/l3ms/hP5sXDB7gSCQLQy8vKV2eV60rRj0yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--nkapron.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HJ9n9kU0; arc=none smtp.client-ip=209.85.167.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--nkapron.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HJ9n9kU0"
Received: by mail-oi1-f202.google.com with SMTP id 5614622812f47-486e64c8edeso2251983b6e.2
        for <linux-usb@vger.kernel.org>; Thu, 18 Jun 2026 21:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781841987; x=1782446787; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SR8zjAKre3J8GnH3WROY30Hd0JabqNU0hbcBZVH8r1Y=;
        b=HJ9n9kU0/NSa9Gjtvoq5usxLRrh9nYYS7chkY630A/JV0WSPz2zn8CSVRLq8e1dWdY
         /cCwSDNHjt6l4U1ZrovMJdOOFUmLSSFFQHo6MbXxruMIDEgnUFoptYOQBjbRopyWvVPv
         ldqpxHMAGWweLraikzB8KXVP4maYeyyjxodfSM7h3fLnycaHIKlpkWPSmFjbKGI7i63R
         oRUbXsFemD86KQIZ/bF7tZqst8rMs6+AZtFm87zXeHoFRjQ4y8FGtAzLLI612IZ/y5WP
         sW2+iBxtIKjF4FkVTsog9FfFRGlFE3ESHZhIj8IXpQhqq2JAD+aUpd5mgpbV+ez0DJWs
         pebw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781841987; x=1782446787;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SR8zjAKre3J8GnH3WROY30Hd0JabqNU0hbcBZVH8r1Y=;
        b=L7XNwRKKDV85tMBWnbSZWOIlNp6Mrf6omaV+EeZKyHW87L533nD6HBH32bZAsd0h1A
         KMnpqWBudpWMuGYk90FPYUAn82liSMQXf6FArN9j8535Vm3LLM4WRE/epAWwk6znOXdV
         3KkeJVALhHrvfg1NfSEJZmgj6VX9JXe9FZBstkB0PHr2Kx/rk4YLw26JZDjkzc58p2+i
         vB3W8KvCGyvLRuz3vHGlwTphcf41HF7p9gmZad4wgGpl9HbZWSm/2nlIYYTFZAVO8uxD
         Nr81gFOj6I8QmI3XbCfUyhEoiJaxZSR4V2edBd8JhuAmYt0Bq2FL5Y9qiLFQeERcBctH
         T8Kw==
X-Gm-Message-State: AOJu0Yw8RoMUVMje92KINvQ6TCB/M9WNSC/3htY4qYVYeG851rJzfN2L
	WWvN2E5k+e+szdYrx2iY2e5ZCpW2yrRpxbWuRWCVoen96F322CQfCgeKDEMm6CI789z00qNOvMA
	L2OShtsf0nQ==
X-Received: from iomr1.prod.google.com ([2002:a5d:9b81:0:b0:996:2f73:a52f])
 (user=nkapron job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:179f:b0:487:5cb4:bada
 with SMTP id 5614622812f47-489aeebfb9amr723113b6e.10.1781841986782; Thu, 18
 Jun 2026 21:06:26 -0700 (PDT)
Date: Fri, 19 Jun 2026 04:06:05 +0000
In-Reply-To: <20260619040609.4010746-1-nkapron@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260619040609.4010746-1-nkapron@google.com>
X-Mailer: git-send-email 2.55.0.rc0.738.g0c8ab3ebcc-goog
Message-ID: <20260619040609.4010746-4-nkapron@google.com>
Subject: [PATCH v2 3/4] usb: gadget: f_fs: Add zero-length packet ioctl
From: Neill Kapron <nkapron@google.com>
To: gregkh@linuxfoundation.org, corbet@lwn.net, skhan@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Neill Kapron <nkapron@google.com>
Content-Type: text/plain; charset="UTF-8"

When transferring data from a USB gadget to a host, a transfer is
considered complete when the host receives a short packet (a packet
smaller than wMaxPacketSize). If the total transfer length is an
exact multiple of wMaxPacketSize, a Zero-Length Packet (ZLP) must
be appended to signal the end of the transfer.

FunctionFS currently provides no mechanism for userspace to instruct
the kernel to set the `req->zero` flag on transfers. Userspace
workarounds, such as manually submitting separate 0-byte requests,
may not be available for legacy protocols which must maintain write
behavior compatibility when moved to functionfs implementations.

To resolve this, introduce a new ioctl, FUNCTIONFS_ENDPOINT_ENABLE_ZLP,
which takes a pointer to a __u32 flag. When enabled, all subsequent
transfers on that endpoint will have the `req->zero` flag set, allowing
the underlying USB Device Controller (UDC) hardware to automatically
append a ZLP only when mathematically required. For logical transfers
chunked across multiple requests, userspace can dynamically toggle this
flag, enabling it only prior to submitting the final chunk.

The flag defaults to false to maintain backward compatibility. Once
enabled, the state is persistent for the lifetime of the endpoint and
will not be reset by opening or closing the endpoint file descriptors.

Assisted-by: Gemini-CLI:gemini-3.1-pro-preview
Signed-off-by: Neill Kapron <nkapron@google.com>
---
 Documentation/usb/functionfs.rst    | 24 ++++++++++++++++++++++++
 drivers/usb/gadget/function/f_fs.c  | 25 ++++++++++++++++++++++++-
 include/uapi/linux/usb/functionfs.h | 23 +++++++++++++++++++++++
 3 files changed, 71 insertions(+), 1 deletion(-)

diff --git a/Documentation/usb/functionfs.rst b/Documentation/usb/functionfs.rst
index f7487b0d8057..582e53549d5b 100644
--- a/Documentation/usb/functionfs.rst
+++ b/Documentation/usb/functionfs.rst
@@ -72,6 +72,30 @@ have been written to their ep0's.
 Conversely, the gadget is unregistered after the first USB function
 closes its endpoints.
 
+Endpoint IOCTLs
+===============
+
+FunctionFS supports additional IOCTLs that can be performed on data endpoints
+(ie. not ep0). For a full list of these IOCTLs, please refer to the documentation
+in ``include/uapi/linux/usb/functionfs.h``.
+
+One such IOCTL is:
+
+  ``FUNCTIONFS_ENDPOINT_ENABLE_ZLP(__u32 *)``
+    Enable or disable automatic zero-length packet (ZLP) appending for the
+    endpoint. The argument is a pointer to a __u32: 0 to disable, non-zero to
+    enable. When enabled, the kernel will automatically append a ZLP at the end
+    of a transfer if the payload length is an exact multiple of the endpoint's
+    max packet size. This is useful for compatibility with legacy protocols
+    which require automatic ZLP appending to data written from userspace. This
+    IOCTL can only be used on IN endpoints. It can be called at any time after
+    the FunctionFS instance is active, even before the host has connected or
+    enabled the endpoint. Returns zero on success, or a negative errno value on
+    error:
+
+    * ``-ENODEV``: The FunctionFS instance is not active.
+    * ``-EINVAL``: The endpoint is not an IN endpoint.
+    * ``-EFAULT``: Invalid user space pointer for the argument.
 DMABUF interface
 ================
 
diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 374ab36eaaa3..07aba722dd5b 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -224,7 +224,7 @@ struct ffs_epfile {
 	unsigned char			in;	/* P: ffs->eps_lock */
 	unsigned char			isoc;	/* P: ffs->eps_lock */
 
-	unsigned char			_pad;
+	u8				zlp_enabled; /* P: ffs->eps_lock */
 
 	/* Protects dmabufs */
 	struct mutex			dmabufs_mutex;
@@ -1114,6 +1114,8 @@ static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
 			req->buf = data;
 			req->num_sgs = 0;
 		}
+
+		req->zero = epfile->zlp_enabled;
 		req->length = data_len;
 
 		io_data->buf = data;
@@ -1165,6 +1167,8 @@ static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
 			req->buf = data;
 			req->num_sgs = 0;
 		}
+
+		req->zero = epfile->zlp_enabled;
 		req->length = data_len;
 
 		io_data->buf = data;
@@ -1707,6 +1711,7 @@ static int ffs_dmabuf_transfer(struct file *file,
 
 	/* Now that the dma_fence is in place, queue the transfer. */
 
+	usb_req->zero = epfile->zlp_enabled;
 	usb_req->length = req->length;
 	usb_req->buf = NULL;
 	usb_req->sg = priv->sgt->sgl;
@@ -1754,6 +1759,7 @@ static long ffs_epfile_ioctl(struct file *file, unsigned code,
 	struct ffs_epfile *epfile = file->private_data;
 	struct ffs_ep *ep;
 	int ret;
+	__u32 enable_zlp = 0;
 
 	if (WARN_ON(epfile->ffs->state != FFS_ACTIVE))
 		return -ENODEV;
@@ -1786,6 +1792,23 @@ static long ffs_epfile_ioctl(struct file *file, unsigned code,
 
 		return ffs_dmabuf_transfer(file, &req);
 	}
+	/*
+	 * We handle this IOCTL before ffs_epfile_wait_ep() to allow userspace
+	 * to configure ZLP behavior immediately without blocking indefinitely
+	 * while waiting for the USB host to connect and enable the endpoint.
+	 */
+	case FUNCTIONFS_ENDPOINT_ENABLE_ZLP:
+		if (!epfile->in)
+			return -EINVAL;
+
+		if (copy_from_user(&enable_zlp, (void __user *)value, sizeof(enable_zlp)))
+			return -EFAULT;
+
+		spin_lock_irq(&epfile->ffs->eps_lock);
+		epfile->zlp_enabled = !!enable_zlp;
+		spin_unlock_irq(&epfile->ffs->eps_lock);
+
+		return 0;
 	default:
 		break;
 	}
diff --git a/include/uapi/linux/usb/functionfs.h b/include/uapi/linux/usb/functionfs.h
index beef1752e36e..06134dca4e8a 100644
--- a/include/uapi/linux/usb/functionfs.h
+++ b/include/uapi/linux/usb/functionfs.h
@@ -414,4 +414,27 @@ struct usb_functionfs_event {
 #define FUNCTIONFS_DMABUF_TRANSFER	_IOW('g', 133, \
 					     struct usb_ffs_dmabuf_transfer_req)
 
+/*
+ * Enable or disable automatic zero-length packet (ZLP) appending for the
+ * endpoint. The argument is a pointer to a __u32: 0 to disable, non-zero to
+ * enable.
+ *
+ * When enabled, the kernel will automatically append a ZLP at the end of
+ * a transfer if the payload length is an exact multiple of the endpoint's
+ * max packet size.
+ *
+ * This is useful for compatibility with legacy protocols which require
+ * automatic ZLP appending to data written from userspace.
+ *
+ * This ioctl can only be used on IN endpoints. It can be called at any time
+ * after the FunctionFS instance is active, even before the host has connected
+ * or enabled the endpoint.
+ *
+ * Returns zero on success, or a negative errno value on error:
+ * -ENODEV: The FunctionFS instance is not active.
+ * -EINVAL: The endpoint is not an IN endpoint.
+ * -EFAULT: Invalid user space pointer for the argument.
+ */
+#define	FUNCTIONFS_ENDPOINT_ENABLE_ZLP	_IOW('g', 134, __u32)
+
 #endif /* _UAPI__LINUX_FUNCTIONFS_H__ */
-- 
2.54.0.1136.gdb2ca164c4-goog

