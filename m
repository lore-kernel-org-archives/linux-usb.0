Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485059;
	b=4pH/o6oGsp23Ka8/P2wiXDKjVfMy4TtIObR7HfWfJnsOXo7gb4ORaDS0Iedyfh9HjRJu
	 OCCfWf9+wFPWxqlI8uqGEDoxXHm5GciFU8ZKjU+u0jR34xFQQAHA427MNDdjITRyp7NXm
	 PaC073p3/F2IUMrdbBxOsxj6/FExj4tH+2OCfZtToZO09IIQt2C1XqhS/3+ZuIfoAxU/R
	 2ajk0HmRbc2286isXNPs0GURaPdvyO+Me8kOJ3P8xPqH+5nLT+VUVd5Er77sLObkDtmWN
	 KWQewpcE86IrzNBu6pQr9mfaMqnsbRcVfhig+Y53nQxAiKHjr5nN/pc0lMkBKLTPgag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485059;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=CTn8AFCSPQvdfYFBnsZw1nD9f5W7CPW1Pcz7cTpboQU=;
	b=mKEWtKYGNz4C4HciMYhu9g5J6nHJDUfHBu/pMzkPblEdLnKL0h+MTFA3+3tCETLTukB6
	 8qzZ+r8QR5VraKv+jpBb5nHTEPysOHFOVwXGVnC7y398+cODHngVQNPueaygLQgYseIG0
	 NMAvi2AfS6nFrpIGbTVbQBTPIwqT38KdqhEQ3TF9XAGA8rsy+yTFNe2U+VT5VBDph3yn+
	 1zUpP14xz9tvxZi0d3gaJf5MavQl1UI4EmCpty9balCGlNG5Ei/PEw+D03e2T4DSovDz3
	 I3wtuM5q3ZasznrALvTuCADGz4fSESGsZ6u9PP2V6UuoA7e1TyQp6al3wrvuaV2SO1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XwbBhTkD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758EB606A319
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 08:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XwbBhTkD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 029251F000C4;
	Tue, 20 Oct 2026 08:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792485059;
	bh=CTn8AFCSPQvdfYFBnsZw1nD9f5W7CPW1Pcz7cTpboQU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XwbBhTkDDjIxu9fRm87nxkxWhsVcpgmirZs8eZoa+DSPnLRp5V4YvHK5fkce5bsKV
	 6CveuiVIDfuKB1iLtnUXZgTFLzLmwpWFXKHFv7gO+PvTbp53zgFQcNtBJRFJwVcYw4
	 fCPwVcaKcmlG4OBmTA8bqx/48zDPVsULvuyF51jV6vEzeqF3SxdT7I4aFas7Kzbax7
	 CTjchvHeL+2DetLlxqFw8xF9gqp103HO6MuHJn215tE6ROgxW9f/+agTYcjiZ+sUvA
	 1mhXC6EEEA7mCIDyOqZrcb3U3BOn7uP3JbBpebmSsqYfgDB8JTnBByN6rla/lkJRk+
	 leb4DnglV2NdA==
Message-ID: <sashiko-outbox-178558@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: gadget: f_fs: check ffs->gadget in the DMABUF
 detach/find paths
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu Zhang" <yuz08559@gmail.com>
Cc: linux-usb@vger.kernel.org
In-Reply-To: <20261020051925.92294-1-yuz08559@gmail.com>
References: <20261020051925.92294-1-yuz08559@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Oct 2026 08:30:58 +0000
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] usb: gadget: f_fs: unsynchronized ffs->gadget access in DMABUF pat=
hs
--

commit 11858230a366468ebcd956f6817d9428b7b67ebc
Author: Yu Zhang <yuz08559@gmail.com>

usb: gadget: f_fs: check ffs->gadget in the DMABUF detach/find paths

This commit adds NULL checks on ffs->gadget in ffs_dmabuf_find_attachment()
and ffs_dmabuf_detach() to prevent a NULL pointer dereference when endpoint
DMABUF ioctls are issued while the functionfs instance is not bound to a UD=
C.

> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/func=
tion/f_fs.c
> index c64a268e98a43..52d486ec218a9 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -1507,9 +1507,15 @@ static int ffs_dma_resv_lock(struct dma_buf *dmabu=
f, bool nonblock)
>  static struct dma_buf_attachment *
>  ffs_dmabuf_find_attachment(struct ffs_epfile *epfile, struct dma_buf *dm=
abuf)
>  {
> -	struct device *dev =3D epfile->ffs->gadget->dev.parent;
> +	struct usb_gadget *gadget =3D epfile->ffs->gadget;
>  	struct dma_buf_attachment *attach =3D NULL;
>  	struct ffs_dmabuf_priv *priv;
> +	struct device *dev;
> +
> +	if (!gadget)
> +		return ERR_PTR(-EPERM);
> +
> +	dev =3D gadget->dev.parent;
> =20
>  	mutex_lock(&epfile->dmabufs_mutex);
> =20
> @@ -1604,11 +1610,17 @@ static int ffs_dmabuf_detach(struct file *file, i=
nt fd)
>  {
>  	struct ffs_epfile *epfile =3D file->private_data;
>  	struct ffs_data *ffs =3D epfile->ffs;
> -	struct device *dev =3D ffs->gadget->dev.parent;
> +	struct usb_gadget *gadget =3D ffs->gadget;
>  	struct ffs_dmabuf_priv *priv, *tmp;
>  	struct dma_buf *dmabuf;
> +	struct device *dev;
>  	int ret =3D -EPERM;
> =20
> +	if (!gadget)
> +		return -EPERM;
> +
> +	dev =3D gadget->dev.parent;
> +
>  	dmabuf =3D dma_buf_get(fd);
>  	if (IS_ERR(dmabuf))
>  		return PTR_ERR(dmabuf);

[Severity: High]
Can reading ffs->gadget without holding ffs->mutex still race with a
concurrent UDC unbind, and does returning -EPERM in ffs_dmabuf_detach()
prevent userspace from detaching DMABUFs after unbind?

In functionfs_unbind(), ffs->gadget is cleared under ffs->mutex:

drivers/usb/gadget/function/f_fs.c:functionfs_unbind() {
	...
	mutex_lock(&ffs->mutex);
	usb_ep_free_request(ffs->gadget->ep0, ffs->ep0req);
	ffs->ep0req =3D NULL;
	ffs->gadget =3D NULL;
	clear_bit(FFS_FL_BOUND, &ffs->flags);
	mutex_unlock(&ffs->mutex);
}

In both ffs_dmabuf_find_attachment() and ffs_dmabuf_detach(), ffs->gadget is
read into a local variable without holding ffs->mutex and without READ_ONCE=
().
Without a lock or compiler barrier, the compiler may reload ffs->gadget aft=
er
the NULL check, or functionfs_unbind() and usb_del_gadget_udc() may complete
and free struct usb_gadget via usb_put_gadget() before gadget->dev.parent is
dereferenced.

Additionally, ffs_func_unbind() does not remove attached DMABUFs from
epfile->dmabufs when the UDC is unbound. Once functionfs_unbind() sets
ffs->gadget to NULL, returning -EPERM when !gadget in ffs_dmabuf_detach()
blocks userspace from detaching previously attached DMABUFs via
FUNCTIONFS_DMABUF_DETACH after receiving FUNCTIONFS_UNBIND (unlike
ffs_epfile_release(), which detaches entries from epfile->dmabufs without
checking ffs->gadget).

Could ffs_dmabuf_detach() match only on priv->attach->dmabuf =3D=3D dmabuf
without consulting ffs->gadget, and could ffs_dmabuf_find_attachment()
synchronize against functionfs_unbind()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020051925.9229=
4-1-yuz08559@gmail.com?part=3D1
