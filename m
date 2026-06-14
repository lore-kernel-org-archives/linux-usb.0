Received: from mail-oi1-f201.google.com (mail-oi1-f201.google.com [209.85.167.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263E71DDC35
	for <linux-usb@vger.kernel.org>; Sun, 14 Jun 2026 18:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781460641; cv=none; b=KDiN6lFOSNsxQznm3WT3XqvKbMSOmqO6TchpSWyGVeI70U3GUU6c21614x3h8BcYW4egi0Y2ElTXPXGbR+zXSwyeLog8GXKgpWbz4df0F5YBttMDlM5T1d7cXhs2g0DeWe65mEg4u7cyhi/zKp7zppWSYBQzDnaJMcTESu67vE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781460641; c=relaxed/simple;
	bh=mnP0I6o8+LGFGdJlsrzM6Epl+Tpi9kxZMbYSdUIIBOk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Dx1GfkTxCSCucrCd2qXgLq45xswcwMNDlDN18UhbpvyGVUunP3erSMxc707ALGiYm4v7imFGSqfzDRZrlds9hBXXRrg/v8uQ4EwNIOyOZR3kh0tKi4MdnpsK1YMOtiPboR3cd1b8pUARWoMldwzorvSOuQgs4TvoftP9YePz3XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--nkapron.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qS3/xCk2; arc=none smtp.client-ip=209.85.167.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--nkapron.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qS3/xCk2"
Received: by mail-oi1-f201.google.com with SMTP id 5614622812f47-48576b309c7so4355048b6e.3
        for <linux-usb@vger.kernel.org>; Sun, 14 Jun 2026 11:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781460639; x=1782065439; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VHKmJTx4oanchUFkxxe/K7AsoeHB5zPMqyzDXEHp9+o=;
        b=qS3/xCk2soZZq8c6U5sgWwK/L3IMFQJ+/WZijmjESjCOe4QWMeG76VO4Tmo+JKroli
         06PzcjSea6pe0qysCap2PJn8n3O5fM8UcUl2LRmmGrfYQEfFVP1XJqp4HOy9N4X0GVnh
         clgx1EA8JL7HzcHNQqzs6Bk54nEApkSUe2iCE0dofkNQm/lFdOLgFciRT6v/pGRglSeb
         Bl33n4yXuNRj4fkIXHddZ9cpPVcst80QN0jniZhjyfH1L7O+8rpEC04x9ywpD6qNUuSH
         vXfI9lx47vmwN/U5I6uC72NPJlZCrEQnzljRab5KKGCa2ST5JTS5N2WTNylRm30aMfge
         6rXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781460639; x=1782065439;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VHKmJTx4oanchUFkxxe/K7AsoeHB5zPMqyzDXEHp9+o=;
        b=inomODlX8t7O8Hy3tu+prDT31ZajAl7r2hUjL217xYmXvAC3wL2au5mswrWfcVx4cC
         x4LwCXt4wM+o24eOr9yZP/1KrsJCmVRH21mGzkDb7f9hEKqbZRl8SwrOv/JzAc4qViwT
         thdyCqNUhQtQF2mZczUShiyBwjVF6luhw593VGsvtvlkYm6rlp/3ZLGxdhI4UEUtWDS0
         aBujTrvQfkotqS0/oKNO/U9LQpbz9y32H01cRiT3chG4XHrL6yO0WfcPKaGpQ11N4bFn
         VlVESEoCRUeXyIRU6EUSNQeHaT4IDgT3XdnybYI2aFddWkT0Ann4VZPWXIW+gba4S1y9
         Ov6g==
X-Gm-Message-State: AOJu0YwWmTul8a5GHqqhMtr9tARC3eFh5e3NKsD+jXkUGDnkElxhpPzd
	ow54Cq+i2Ghr0RMm7uqwE4SVUF8v+annwSAZaYsb+2f4lfOmWM9/Ikuhh00EApoFiry4Jh0Vtuf
	It108QdHpLQ==
X-Received: from ilqc8.prod.google.com ([2002:a92:c8c8:0:b0:502:1005:fde])
 (user=nkapron job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:6f8e:b0:485:1618:a84a
 with SMTP id 5614622812f47-4872f5a491dmr7433918b6e.37.1781460639065; Sun, 14
 Jun 2026 11:10:39 -0700 (PDT)
Date: Sun, 14 Jun 2026 18:10:02 +0000
In-Reply-To: <20260614181006.3648010-1-nkapron@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260614181006.3648010-1-nkapron@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260614181006.3648010-4-nkapron@google.com>
Subject: [PATCH 3/3] usb: gadget: f_fs: Introduce rw_proxy file descriptors
From: Neill Kapron <nkapron@google.com>
To: gregkh@linuxfoundation.org, corbet@lwn.net, skhan@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Neill Kapron <nkapron@google.com>
Content-Type: text/plain; charset="UTF-8"

Currently, FunctionFS exposes each USB endpoint as a separate,
unidirectional file descriptor (e.g., `ep1` for IN, `ep2` for OUT).
While this mirrors the underlying hardware structure, it forces
userspace daemons implementing bidirectional protocols to manage
multiple file descriptors. When dealing with legacy protocols which
require exposing a single, bi-directional fd to userspace, this becomes
problematic.

This patch introduces the `FUNCTIONFS_RW_PROXY_EPS` UAPI flag. When
passed in the descriptor header during initialization, FunctionFS
provisions a "rw_proxy" bidirectional file descriptor (e.g., `ep1_rw`)
alongside every pair of IN/OUT endpoints.

Implementation details:
- RW proxy files act as a pure VFS alias, proxying operations
  directly to the base ffs_epfile instances. A `read()` proxies to
  the OUT endpoint's file, and a `write()` proxies to the IN file.
- Because operations are proxied natively, they reuse the underlying
  base endpoint's lock (`epfile->mutex`) and tracking state. This
  serializes concurrent read or write operations, preventing buffer
  corruption and race conditions even if userspace mixes transfers across
  both the rw_proxy and base files. This approach allows full-duplex
  synchronous operations to occur concurrently without serializing on a
  single lock.
- Control operations (like IOCTLs) and intentional stalls (via
  reverse-direction I/O) must still be issued on the base endpoints, as the
  rw_proxy returns `-ENOTTY` for IOCTLs and cannot trigger stalls.

Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Neill Kapron <nkapron@google.com>
---
 Documentation/usb/functionfs.rst    |  56 ++++++++++++++
 drivers/usb/gadget/function/f_fs.c  | 109 +++++++++++++++++++++++-----
 drivers/usb/gadget/function/u_fs.h  |   8 +-
 include/uapi/linux/usb/functionfs.h |   1 +
 4 files changed, 156 insertions(+), 18 deletions(-)

diff --git a/Documentation/usb/functionfs.rst b/Documentation/usb/functionfs.rst
index 582e53549d5b..b189cf5626ba 100644
--- a/Documentation/usb/functionfs.rst
+++ b/Documentation/usb/functionfs.rst
@@ -96,6 +96,58 @@ One such IOCTL is:
     * ``-ENODEV``: The FunctionFS instance is not active.
     * ``-EINVAL``: The endpoint is not an IN endpoint.
     * ``-EFAULT``: Invalid user space pointer for the argument.
+
+RW Proxy Endpoints
+==================
+
+If the ``FUNCTIONFS_RW_PROXY_EPS`` flag is passed in the descriptor header
+(requires ``FUNCTIONFS_DESCRIPTORS_MAGIC_V2``), FunctionFS will provision a
+bidirectional rw_proxy file descriptor (e.g., "ep1_rw") alongside each pair
+of IN and OUT endpoints. The rw_proxy file aliases the underlying hardware
+endpoints, allowing userspace to use a single file descriptor for both reading
+(OUT) and writing (IN).
+
+This flag requires the total number of hardware endpoints to be an even number.
+FunctionFS will automatically walk the provided endpoints and group them into
+adjacent pairs (e.g., ep1 and ep2 form the first pair, ep3 and ep4 form the
+second pair). Each pair must consist of exactly one IN endpoint and one OUT
+endpoint.
+
+For each valid pair, a rw_proxy file is created and named after the first
+endpoint in the pair with a "_rw" suffix. For example, if ep1 and ep2 are
+paired, a rw_proxy file named "ep1_rw" is created. If ep3 and ep4 are paired,
+"ep3_rw" is created.
+
+If the ``FUNCTIONFS_VIRTUAL_ADDR`` flag is also enabled, the endpoints will be
+named using their physical endpoint address in hexadecimal instead of their
+index. RW proxy files will inherit this naming convention. For example, if the
+first endpoint of a pair maps to address 0x02, the rw_proxy file will be
+named "ep02_rw".
+
+When this flag is enabled, userspace has the choice of performing data transfers
+via the single rw_proxy file descriptor or the two base file descriptors. The
+rw_proxy file descriptor acts as a pure VFS alias that proxies all operations
+directly to the underlying base file descriptors.
+
+Because it is a pure proxy, there are no data races or buffer corruptions if
+userspace uses both the rw_proxy endpoint and the base endpoints concurrently.
+The native mutexes of the base endpoints perfectly serialize all concurrent
+transfers. However, userspace should generally pick one method and stick to it
+to avoid interleaving its own data stream.
+
+- **IOCTLs (Clear Halt, etc.):** RW proxy endpoints do not support IOCTLs and
+  will return ``-ENOTTY``. To clear a host-initiated halt, userspace must issue
+  the ``FUNCTIONFS_CLEAR_HALT`` ioctl directly on the corresponding base
+  endpoint file descriptor.
+- **Intentional Stalls:** The traditional mechanism for intentionally halting an
+  endpoint by issuing a reverse-direction data operation (e.g., attempting to
+  read from an IN endpoint) continues to work, but it must be issued on the
+  base endpoint. RW proxy endpoints cannot be used to trigger a stall because
+  they are fully bidirectional.
+
+Note that DMABUF data transfers (``FUNCTIONFS_DMABUF_TRANSFER``) are unsupported
+via the rw_proxy endpoint because it does not support IOCTLs. If DMABUF
+transfers are required, users must use the standard base endpoints.
 DMABUF interface
 ================
 
@@ -103,6 +155,10 @@ FunctionFS additionally supports a DMABUF based interface, where the
 userspace can attach DMABUF objects (externally created) to an endpoint,
 and subsequently use them for data transfers.
 
+Note: The DMABUF interface is unsupported on rw_proxy endpoints. See
+the RW Proxy Endpoints section for details on using DMABUF alongside
+the ``FUNCTIONFS_RW_PROXY_EPS`` flag.
+
 A userspace application can then use this interface to share DMABUF
 objects between several interfaces, allowing it to transfer data in a
 zero-copy fashion, for instance between IIO and the USB stack.
diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 4c1bafb3eef5..0ccfdcfb1810 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -159,7 +159,9 @@ struct ffs_epfile {
 	struct mutex			mutex;
 
 	struct ffs_data			*ffs;
-	struct ffs_ep			*ep;	/* P: ffs->eps_lock */
+	struct ffs_ep			*ep;		/* P: ffs->eps_lock */
+	struct ffs_epfile		*epfile_in;	/* P: ffs->eps_lock */
+	struct ffs_epfile		*epfile_out;	/* P: ffs->eps_lock */
 
 	/*
 	 * Buffer for holding data from partial reads which may happen since
@@ -219,17 +221,20 @@ struct ffs_epfile {
 	struct ffs_buffer		*read_buffer;
 #define READ_BUFFER_DROP ((struct ffs_buffer *)ERR_PTR(-ESHUTDOWN))
 
-	char				name[5];
+	char				name[10];
 
 	unsigned char			in;	/* P: ffs->eps_lock */
 	unsigned char			isoc;	/* P: ffs->eps_lock */
 
 	u8				zlp_enabled; /* P: ffs->eps_lock */
+	bool				is_rw_proxy;
 
 	/* Protects dmabufs */
 	struct mutex			dmabufs_mutex;
 	struct list_head		dmabufs; /* P: dmabufs_mutex */
 	atomic_t			seqno;
+
+	int				opened_count; /* P: ffs->eps_lock */
 };
 
 struct ffs_buffer {
@@ -978,9 +983,8 @@ static ssize_t __ffs_epfile_read_data(struct ffs_epfile *epfile,
 	return ret;
 }
 
-static struct ffs_ep *ffs_epfile_wait_ep(struct file *file)
+static struct ffs_ep *ffs_epfile_wait_ep(struct ffs_epfile *epfile, struct file *file)
 {
-	struct ffs_epfile *epfile = file->private_data;
 	struct ffs_ep *ep;
 	int ret;
 
@@ -1007,17 +1011,22 @@ static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
 	char *data = NULL;
 	ssize_t ret, data_len = -EINVAL;
 	int halt;
+	bool is_rw_proxy = epfile->is_rw_proxy;
 
 	/* Are we still active? */
 	if (WARN_ON(epfile->ffs->state != FFS_ACTIVE))
 		return -ENODEV;
 
-	ep = ffs_epfile_wait_ep(file);
+	/* Proxy to base endpoint if rw_proxy */
+	if (is_rw_proxy)
+		epfile = io_data->read ? epfile->epfile_out : epfile->epfile_in;
+
+	ep = ffs_epfile_wait_ep(epfile, file);
 	if (IS_ERR(ep))
 		return PTR_ERR(ep);
 
 	/* Do we halt? */
-	halt = (!io_data->read == !epfile->in);
+	halt = is_rw_proxy ? 0 : (!io_data->read == !epfile->in);
 	if (halt && epfile->isoc)
 		return -EINVAL;
 
@@ -1115,7 +1124,7 @@ static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
 			req->num_sgs = 0;
 		}
 
-		req->zero = epfile->zlp_enabled;
+		req->zero = !io_data->read ? epfile->zlp_enabled : 0;
 		req->length = data_len;
 
 		io_data->buf = data;
@@ -1168,7 +1177,7 @@ static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
 			req->num_sgs = 0;
 		}
 
-		req->zero = epfile->zlp_enabled;
+		req->zero = !io_data->read ? epfile->zlp_enabled : 0;
 		req->length = data_len;
 
 		io_data->buf = data;
@@ -1225,6 +1234,12 @@ ffs_epfile_open(struct inode *inode, struct file *file)
 		spin_unlock_irq(&ffs->eps_lock);
 		return -ENODEV;
 	}
+	if (epfile->is_rw_proxy) {
+		epfile->epfile_in->opened_count++;
+		epfile->epfile_out->opened_count++;
+	} else {
+		epfile->opened_count++;
+	}
 	ffs->opened++;
 	spin_unlock_irq(&ffs->eps_lock);
 
@@ -1378,8 +1393,18 @@ ffs_epfile_release(struct inode *inode, struct file *file)
 
 	mutex_unlock(&epfile->dmabufs_mutex);
 
-	__ffs_epfile_read_buffer_free(epfile);
-	ffs_data_closed(epfile->ffs);
+	spin_lock_irq(&ffs->eps_lock);
+	if (epfile->is_rw_proxy) {
+		epfile->epfile_in->opened_count--;
+		if (--epfile->epfile_out->opened_count == 0)
+			__ffs_epfile_read_buffer_free(epfile->epfile_out);
+	} else {
+		if (--epfile->opened_count == 0)
+			__ffs_epfile_read_buffer_free(epfile);
+	}
+	spin_unlock_irq(&ffs->eps_lock);
+
+	ffs_data_closed(ffs);
 
 	return 0;
 }
@@ -1647,7 +1672,7 @@ static int ffs_dmabuf_transfer(struct file *file,
 
 	priv = attach->importer_priv;
 
-	ep = ffs_epfile_wait_ep(file);
+	ep = ffs_epfile_wait_ep(epfile, file);
 	if (IS_ERR(ep)) {
 		ret = PTR_ERR(ep);
 		goto err_attachment_put;
@@ -1765,6 +1790,9 @@ static long ffs_epfile_ioctl(struct file *file, unsigned code,
 	if (WARN_ON(epfile->ffs->state != FFS_ACTIVE))
 		return -ENODEV;
 
+	if (epfile->is_rw_proxy)
+		return -ENOTTY;
+
 	switch (code) {
 	case FUNCTIONFS_DMABUF_ATTACH:
 	{
@@ -1815,7 +1843,7 @@ static long ffs_epfile_ioctl(struct file *file, unsigned code,
 	}
 
 	/* Wait for endpoint to be enabled */
-	ep = ffs_epfile_wait_ep(file);
+	ep = ffs_epfile_wait_ep(epfile, file);
 	if (IS_ERR(ep))
 		return PTR_ERR(ep);
 
@@ -2213,7 +2241,7 @@ static void ffs_data_closed(struct ffs_data *ffs)
 
 		if (epfiles)
 			ffs_epfiles_destroy(ffs->sb, epfiles,
-					 ffs->eps_count);
+					 ffs->epfiles_count);
 
 		if (ffs->setup_state == FFS_SETUP_PENDING)
 			__ffs_ep0_stall(ffs);
@@ -2271,7 +2299,7 @@ static void ffs_data_clear(struct ffs_data *ffs)
 	 * copy of epfile will save us from use-after-free.
 	 */
 	if (epfiles) {
-		ffs_epfiles_destroy(ffs->sb, epfiles, ffs->eps_count);
+		ffs_epfiles_destroy(ffs->sb, epfiles, ffs->epfiles_count);
 		ffs->epfiles = NULL;
 	}
 
@@ -2369,11 +2397,16 @@ static void functionfs_unbind(struct ffs_data *ffs)
 static int ffs_epfiles_create(struct ffs_data *ffs)
 {
 	struct ffs_epfile *epfile, *epfiles;
-	unsigned i, count;
+	unsigned int i, count, epfiles_count;
 	int err;
 
 	count = ffs->eps_count;
-	epfiles = kzalloc_objs(*epfiles, count);
+	epfiles_count = count;
+	if (ffs->user_flags & FUNCTIONFS_RW_PROXY_EPS)
+		epfiles_count += count / 2;
+	ffs->epfiles_count = epfiles_count;
+
+	epfiles = kzalloc_objs(*epfiles, epfiles_count);
 	if (!epfiles)
 		return -ENOMEM;
 
@@ -2396,6 +2429,32 @@ static int ffs_epfiles_create(struct ffs_data *ffs)
 		}
 	}
 
+	if (ffs->user_flags & FUNCTIONFS_RW_PROXY_EPS) {
+		struct ffs_epfile *comp = epfiles + count;
+
+		for (i = 0; i < count; i += 2, ++comp) {
+			struct ffs_epfile *ep1 = &epfiles[i];
+			struct ffs_epfile *ep2 = &epfiles[i + 1];
+			bool ep1_in = ffs->eps_addrmap[i + 1] & USB_ENDPOINT_DIR_MASK;
+
+			comp->ffs = ffs;
+			comp->is_rw_proxy = true;
+			comp->epfile_in = ep1_in ? ep1 : ep2;
+			comp->epfile_out = ep1_in ? ep2 : ep1;
+			mutex_init(&comp->mutex);
+			mutex_init(&comp->dmabufs_mutex);
+			INIT_LIST_HEAD(&comp->dmabufs);
+			snprintf(comp->name, sizeof(comp->name), "%s_rw",
+				 epfiles[i].name);
+			err = ffs_sb_create_file(ffs->sb, comp->name,
+						 comp, &ffs_epfile_operations);
+			if (err) {
+				ffs_epfiles_destroy(ffs->sb, epfiles, count + (i / 2));
+				return err;
+			}
+		}
+	}
+
 	ffs->epfiles = epfiles;
 	return 0;
 }
@@ -2972,7 +3031,8 @@ static int __ffs_data_got_descs(struct ffs_data *ffs,
 			      FUNCTIONFS_VIRTUAL_ADDR |
 			      FUNCTIONFS_EVENTFD |
 			      FUNCTIONFS_ALL_CTRL_RECIP |
-			      FUNCTIONFS_CONFIG0_SETUP)) {
+			      FUNCTIONFS_CONFIG0_SETUP |
+			      FUNCTIONFS_RW_PROXY_EPS)) {
 			ret = -ENOSYS;
 			goto error;
 		}
@@ -3060,6 +3120,21 @@ static int __ffs_data_got_descs(struct ffs_data *ffs,
 		goto error;
 	}
 
+	if (ffs->user_flags & FUNCTIONFS_RW_PROXY_EPS) {
+		if (ffs->eps_count % 2) {
+			ret = -EINVAL;
+			goto error;
+		}
+
+		for (i = 1; i < ffs->eps_count; i += 2) {
+			if ((ffs->eps_addrmap[i] & USB_ENDPOINT_DIR_MASK) ==
+			    (ffs->eps_addrmap[i + 1] & USB_ENDPOINT_DIR_MASK)) {
+				ret = -EINVAL;
+				goto error;
+			}
+		}
+	}
+
 	ffs->raw_descs_data	= _data;
 	ffs->raw_descs		= raw_descs;
 	ffs->raw_descs_length	= data - raw_descs;
diff --git a/drivers/usb/gadget/function/u_fs.h b/drivers/usb/gadget/function/u_fs.h
index 6a80182aadd7..c280c495fbd2 100644
--- a/drivers/usb/gadget/function/u_fs.h
+++ b/drivers/usb/gadget/function/u_fs.h
@@ -252,8 +252,14 @@ struct ffs_data {
 
 	unsigned short			strings_count;
 	unsigned short			interfaces_count;
+
+	/*
+	 * eps_count tracks the number of underlying hardware endpoints.
+	 * epfiles_count tracks the total number of VFS endpoint files.
+	 * When companion endpoints are active, epfiles_count > eps_count.
+	 */
 	unsigned short			eps_count;
-	unsigned short			_pad1;
+	unsigned short			epfiles_count;
 
 	/* filled by __ffs_data_got_strings() */
 	/* ids in stringtabs are set in functionfs_bind() */
diff --git a/include/uapi/linux/usb/functionfs.h b/include/uapi/linux/usb/functionfs.h
index 06134dca4e8a..290308c9dd92 100644
--- a/include/uapi/linux/usb/functionfs.h
+++ b/include/uapi/linux/usb/functionfs.h
@@ -25,6 +25,7 @@ enum functionfs_flags {
 	FUNCTIONFS_EVENTFD = 32,
 	FUNCTIONFS_ALL_CTRL_RECIP = 64,
 	FUNCTIONFS_CONFIG0_SETUP = 128,
+	FUNCTIONFS_RW_PROXY_EPS = 256,
 };
 
 /* Descriptor of an non-audio endpoint */
-- 
2.54.0.1136.gdb2ca164c4-goog

