Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603F6364029
	for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2026 21:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789940518; cv=none; b=MEt7x9jJ5hIs3jdakJNolDKQcAoGWSjYk/GtSLfXCcUU9X8dXeHqfpn5sZE834xKRyc0GFWsX+QECtm+uxNdcVoE1aDzANKo2cvE5a4GfQnVqGQKlVnfxF/URhctJlgShQ8iZDeY8p/0o9OddGZxUua/EDWxcL4LF3qlkLK8TiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789940518; c=relaxed/simple;
	bh=l17UvQuByLroM1p/TmzKhJVFbcPt1DNgaKRPU27Fpk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=skNzPalz1kwZ0hkEKUrgBhIp3m6BbVZzmlX35qM5LrS7drtNhndzSCKtkqLpQb4Jxv0L7vVbJ+0XsPHkECSwBiyYpQZYL8/qwOsKMQqDWtqn6ZMCqAH/SJn+2/yB2HPIQPtgUQBOYPJRZZ081vkUBML7HeL1xx92za3GXm7qgFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=N4Mcog0Q; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="N4Mcog0Q"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-52fb76906adso36459431cf.0
        for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2026 14:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1789940516; x=1790545316; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TtM4OfzYh4zf76Wl8rAMYpmJaZdR0+PvCy/Hv7ec/W0=;
        b=N4Mcog0QvrRqhM10vp8rgmQS/DtwL5OMMe18F9eaj850qTeUt1ug4+e4CMDH2toXsu
         m9JEYsZn/QwyFYUd9unV88h5LSH7t9WIoWAVnAIoIjkUUCFLDMcDSEQFrSjoKTAYLPjF
         765zN/9c+MFTKIglUiDm2xpCXCde5zxk6grfEJH9sKaaocV1DvD8p2AnY8KrLII1O0jg
         9CSe7Isa+78DWx0P3OXvco9Yp2l8wrpSot2J5gSXWmui9nIWMsG5sl0HINJtsCsGg9es
         DgL/wKM5fufLB5zNzsl9MSLKULBd4syWU05EWFoB5/+Ak/eckXVdsdkYj4wHro8cVlJ9
         vQOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789940516; x=1790545316;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TtM4OfzYh4zf76Wl8rAMYpmJaZdR0+PvCy/Hv7ec/W0=;
        b=WiwDpV41ShezZAXmEAlpI4Za2J7ZFsjAOoLKhBtiAutqHEWejl2pJ66qVFjDkO0jGS
         uSThWeIm6oBB4bpZW5r7BlD3KMFXc7oE31/7K3i+fkTPWkc243MpFOjPF/E5ScZvXdY6
         UUqXzddQ2Q6lVfAu3TZ2htXhdu/8+xp0ebTeVLBGkuUKc8reHSdSUlW9YryFqssXrcwG
         UiIt4Xn03dJQJEK1cjBQzjKev7bVaJpYrzeei2bs83H/3FupYqVxQBXPC9q0NOtiOpfc
         mRYL35V/5KB+FCmY/obNtUnFp/cfk5ItlPESns4eXSyLCFEinbImePPzXC4kGkf3/6lv
         mjeQ==
X-Forwarded-Encrypted: i=1; AKwUvBytuzH80ueF1xtk6kY+WSu7R5JsKBlPB3e1RjvrCyfUFzcKgiITeQUbXYl+PCwDvN7FCqoVAwrVufQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kD95J7nsOmrbwj9xpV+kyz/eXWPQd9Jc9S5epgQEGcaj06X7Wd
	D/dE6x6k/7ogHHM6X+XiVxsUrrIYGYoLWTOkZk4BjXGSck/yKbt2KrK3iyHfdD6NtQ==
X-Gm-Gg: AYBFou0hDTaf/H2hOFxX3mTN+4qXSACVZ+O2lZBiQQ4HXrc2kOS0/h6TgSI1d/aX7yf
	cCStZK6pbTV3MImLyWK8EphZmb24OIgkk/DXFAWGkjwHXGw8mi3dzeXy2DgMZyFIw2OyVscRE67
	woi8hfjCDK+8q4BKo9uTbuH4/5CldzLyJlYZVTtMmfzioJcAnyHKzREHsdauEkT85nFz7z1r26D
	9B2DeY/2j7BdUWH5olV2IcLBCS+iHmqG1UXvL2/MJN63CzkHJCJq8yEMPG6pwEcKDrlLtkmuRVU
	dbo9zCVTPNWqxNPC+arAPfh548dNSwpybGBMlG/eZ6lJN72W7+lsu+Zz2YMmVTZtHXjfjg5ZTwL
	5D5W2HCADzOLOKpNOGBKmtBF+1uIMeR2tdMwYTl0b/wGhY6wZoV0UG+9A+oaS8dyMUHkaKuV43K
	bl2tEimb5TYtHA1BAICRP4pZLHDnFgSbiuK7RrYempH5iWgysBws3gVPGqOmjcr4XaLjxhUt2Ab
	xPLZG4q78M=
X-Received: by 2002:a05:622a:610:b0:532:a5a2:e3f4 with SMTP id d75a77b69052e-532b72e66fcmr77358741cf.41.1789940516156;
        Sun, 20 Sep 2026 14:41:56 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532ae76d5a7sm48329221cf.27.2026.09.20.14.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 14:41:55 -0700 (PDT)
Date: Sun, 20 Sep 2026 17:41:53 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Minseo Kim <neck3922@gmail.com>,
	USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH 2/3] USB: gadgetfs: Fix test for copying data in asynchronous
 I/O
Message-ID: <a9a88aa0-a624-4b42-a9f7-661d50a4894b@rowland.harvard.edu>
References: <c06cb937-6872-401a-8c94-1944f2838007@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c06cb937-6872-401a-8c94-1944f2838007@rowland.harvard.edu>

The gadgetfs driver contains a test for whether any data from a
completed asynchronous I/O transfer needs to be copied back to
userspace.  This test is not being done correctly in all cases.  It's
a subtle issue involving whether an iov_iter requires a separate iovec
for storing its destination buffer information; sometimes this
information can be stored directly in the iov_iter itself.  Thus, lack
of a separate iovec does not mean that there is no data to copy.

Rather than messing around with the internal details of struct
iov_iter, fix the test by simply adding a new field to keep track of
whether an AIO operation is a read or a write.

Reported-by: Minseo Kim <neck3922@gmail.com>
Closes: https://lore.kernel.org/CAFmvuTWc880R=mw7=kixfx3Yb8u9thLHPA7D=rm6a8p9dYBBDA@mail.gmail.com/
Tested-by: Minseo Kim <neck3922@gmail.com>
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>

---

 drivers/usb/gadget/legacy/inode.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

Index: usb-devel/drivers/usb/gadget/legacy/inode.c
===================================================================
--- usb-devel.orig/drivers/usb/gadget/legacy/inode.c
+++ usb-devel/drivers/usb/gadget/legacy/inode.c
@@ -462,6 +462,7 @@ struct kiocb_priv {
 	unsigned		actual;
 	enum aio_req_state	req_state;
 	enum aio_cancel_state	cancel_state;
+	bool			is_read;
 };
 
 static void ep_unlink_worker(struct work_struct *work)
@@ -578,7 +579,7 @@ static void ep_aio_complete(struct usb_e
 	 * don't need to copy anything to userspace, so we can
 	 * complete the aio request immediately.
 	 */
-	if (priv->to_free == NULL || unlikely(req->actual == 0)) {
+	if (!priv->is_read || unlikely(req->actual == 0)) {
 		mmdrop(priv->mm);
 		kfree(req->buf);
 		kfree(priv->to_free);
@@ -745,6 +746,7 @@ ep_read_iter(struct kiocb *iocb, struct
 		value = -ENOMEM;
 		if (!priv)
 			goto fail;
+		priv->is_read = true;
 		priv->to_free = dup_iter(&priv->to, to, GFP_KERNEL);
 		if (!iter_is_ubuf(&priv->to) && !priv->to_free) {
 			kfree(priv);
