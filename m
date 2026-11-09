Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794241337;
	b=kDT/KMPATc+SBG3gY1YkMXqCd7LeNipqF+hV5GCY+9ESWR02ZH3b0gJ+AKD0J7lfP+9D
	 v7Yplq+t81fmI0pPiHXH6c2uAPIrXMvJjM47chGG89YlnobzIf1I/P9BXctzp6CIqLq/x
	 Pf5B/ydSLcMwtfTcQTK68dVEcnboWmS+m9OrMbXS5jjdsY64PvOtSbR6kb7J8R+U1uw4Z
	 CwyIPhYZeUOyRytIZacn21VmfPOckfNHZe7n9VH2hG61asKizP8X4bPyyF0sNEJRnDAOO
	 CpDNBPRllEe3UNhW8ZoWncZcTCGmCO77HlRPJFn5u+94cKaxq/iGcRJqT+JovLv0kjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794241337;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=uAScKcC7U5Gza48nvZ3dmH1iFZWDY2KqONvD6wJBBz4=;
	b=qXDzRiro8IWUDyrl+UKktjEZoEKY3imEBdXkhUeSCdxPZeCyX0ePws1AENr7/moojCxl
	 PvWSHE8Wi4ydNm38i7Eqnt/iuFHBE9YmevsYsZan1pJj4WswSiihlvcw322nWWQ1Frhmr
	 Te6d9LghlO79JI1bEgJTHhhjuunin3kCR+nH2+wF/WOXFoLqTOwL5yAyF4tPJPS7DMKdI
	 cNpz+0a7fJcWrwme1Zna8va9+c0eiJOkdxvA/aJDcJq8BWJ6uLSBbBxcYStFzN8Nwv8AH
	 4ypwjkvMFxAzIN/2WDaQyfnhO6hx65bdZaLmwA1biKCBbmdr8bSsdhZ+qKS2jp28Kww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b="dQmYVZ/K";
	arc=none smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CEB606A31C
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 16:22:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30CEB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=dQmYVZ/K
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5495d549924so11049711cf.1
        for <linux-usb@vger.kernel.org>; Mon, 09 Nov 2026 08:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794241335; x=1794846135; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uAScKcC7U5Gza48nvZ3dmH1iFZWDY2KqONvD6wJBBz4=;
        b=dQmYVZ/Kx6L1CASTHctXlStJYQ9NvHkz1nWgQIpVQi/GzlfAUKG2m65kbAvdPMwl/n
         +67xL1nGlmPE/OJilzOJWTyeb2ELqyHoR71tQXawmP14Dfd9IxlgkU/swfm+3hpFW8SU
         9serc03+OCJtu7kSXv8dRJSAJRXWdXhP6rp3n/f4+bAfvzedY3/guccCo8Hm21Yuc2bJ
         tmtwX7ehp32YQZAP1+oh8xtagdiSUDXMvCGvcBZ4X8i4yJMWRrDE5i0zCxRhXGPgge8/
         hU5gb/Flr4xhuTrC4+At7rKSVudWi+Gsj6SjsBeMVOkxt+/UzQfnxf0m2RSZvwzvzPVA
         OBeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794241335; x=1794846135;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uAScKcC7U5Gza48nvZ3dmH1iFZWDY2KqONvD6wJBBz4=;
        b=zoW3nyjCNr2s3xPQAEWp892va1wzctomRyMdRu8pw2+IHRlX5tyxBuJ2pgfjvoVOcf
         /xGVRjg4owFrlPylvSuGu22X0kpx0PmwE10cwG8WcwlWTxnqbKO/7669/J668R30rXEO
         jdJGBkADa3a/RblX3XuPhkluDiLtkvcKyfFORF0M9JBIIS+4fBIytKX3ICWENPJXJPf4
         i67sg0H0eqy6pdZg5YvxzzxOGeJfG+wfUyKMln8ioVJfWx6R137yPzDcmh5O9zKJJuEv
         SOnR5FSyTWwa+snlCtPpB98B1GMT1xS12xi3MrleWCmcy1DILXdyfDAQ+vq9yGNsrrET
         +/8g==
X-Forwarded-Encrypted: i=1; AL+hErEPOfZEwvXKA/vuv4SRPz9ZVktlIa4/MtC9w5dBx9VQcoDW3h2sK7PM+oIKvWXvhPj4tWtm+R765y4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5Oe7OPU34guvNqsueYrCxiDsUeWQ0ed4raSEczQnrSKmhIMiV
	P75L/94vNgeUnrCHKmjCrg7TWnk7epj3T7LuE/Le28RAB+h2311oNnUQ57bE2+YD2A==
X-Gm-Gg: AYBFou01JHbnw1AQ8pK2U+wZ+ETr7AQIxBOBZzJhz7aMcBCdPlLs5Rl6ZfrTatxy1Ni
	g0t6AccJV0jdvG9Mji7wy335jc+TA7h5hko6ehOrQGu2LJgkc0PwClM5tsIUioFyz+udgp+4cwQ
	OISpbLDqet+W6Nx3+Jtn1n4pxB8kYOCHCiPTlhgrtJcAYuD40yXS/B+CWZgfYS8LYpD9tW1xszr
	JG4n3rGzuikUgSS2n8ec6lD8IoypGE4Do7D9ptLmkE7P/2JeD0vXQYNXoNyr+u+NHrEJ+ptBnBh
	jL+p+F7iuyGSn45msj2lZ8ll51El9qpKtJNdtXoEGRvJJ98vFxpxQ7xkUTRpyMUv3NjQY0nELbP
	rgd0YLZlNemE8AH9485XLrXauPSZiNdqB5pmNOIe6i/Sv/6/Fcqp41G01B6q5gJia6j7mwnlCGP
	sMbqOiQgEVSqGneoFBWpXt7P/dPCxl7VO3cIuKXJP+lozNdYaCpFubdGkr+EIJv0tQ582NBBKNQ
	8Lb/40KBSJQsX/C84cu9Fdb98L1P3YdkZm89nqYZjRIyDSGWIJG5T+T9ZrKN3CpU1tTOLIG2hoh
	DHPuf1HEs0FAehNeyKmBhPJL7PMrMTrkmkdnMK0Bi86O9zitkA==
X-Received: by 2002:ac8:5f82:0:b0:530:d429:c70a with SMTP id d75a77b69052e-552a4ccc613mr69150011cf.26.1794241334989;
        Mon, 09 Nov 2026 08:22:14 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91eced95bf3sm45903146d6.14.2026.11.09.08.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:22:14 -0800 (PST)
Date: Mon, 9 Nov 2026 11:22:11 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: kayano050408@gmail.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Neill Kapron <nkapron@google.com>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v6 3/3] usb: gadget: gadgetfs: avoid writing through the
 const setup pointer
Message-ID: <2d4f4553-e9a0-4649-ab17-d62f7f1f1c5a@rowland.harvard.edu>
References: <20261109-b4-gadgetfs-ep0-v6-0-b410e3dced89@gmail.com>
 <20261109-b4-gadgetfs-ep0-v6-3-b410e3dced89@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109-b4-gadgetfs-ep0-v6-3-b410e3dced89@gmail.com>

On Mon, Nov 09, 2026 at 02:50:53PM +0800, Jing Lin via B4 Relay wrote:
> From: Jing Lin <kayano050408@gmail.com>
> 
> gadgetfs_setup() receives the setup packet as const, but clamps an
> oversized control IN request by casting away the constness and writing
> the truncated length back into the caller's wLength field.
> 
> The setup() callback has no business modifying the setup packet.  Use a
> local copy of the request for the clamped length instead.  Userspace
> still observes the truncated wLength in the GADGETFS_SETUP event, and
> the queued request length is unchanged.
> 
> Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Jing Lin <kayano050408@gmail.com>
> ---
>  drivers/usb/gadget/legacy/inode.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legacy/inode.c
> index d8dfc1897..7c48214ba 100644
> --- a/drivers/usb/gadget/legacy/inode.c
> +++ b/drivers/usb/gadget/legacy/inode.c
> @@ -1543,6 +1543,7 @@ gadgetfs_setup (struct usb_gadget *gadget, const struct usb_ctrlrequest *ctrl)
>  	struct usb_request		*req = dev->req;
>  	int				value = -EOPNOTSUPP;
>  	struct usb_gadgetfs_event	*event;
> +	struct usb_ctrlrequest		ctrl_buf;
>  	u16				w_value = le16_to_cpu(ctrl->wValue);
>  	u16				w_length = le16_to_cpu(ctrl->wLength);
>  
> @@ -1552,10 +1553,10 @@ gadgetfs_setup (struct usb_gadget *gadget, const struct usb_ctrlrequest *ctrl)
>  
>  	if (w_length > RBUF_SIZE) {
>  		if (ctrl->bRequestType & USB_DIR_IN) {
> -			/* Cast away the const, we are going to overwrite on purpose. */
> -			__le16 *temp = (__le16 *)&ctrl->wLength;
> -
> -			*temp = cpu_to_le16(RBUF_SIZE);
> +			/* Report the length we can actually handle to userspace. */
> +			ctrl_buf = *ctrl;
> +			ctrl_buf.wLength = cpu_to_le16(RBUF_SIZE);
> +			ctrl = &ctrl_buf;
>  			w_length = RBUF_SIZE;
>  		} else {
>  			spin_unlock(&dev->lock);
> 

This is kind of silly.  There's no need to copy the entire structure.

In fact, ctrl->wLength isn't used again anywhere in this routine except 
for the line that initializes event->u.setup by copying *ctrl into it.  
All you need to do is this:

 			event->u.setup = *ctrl;
+			/* Report the length we can actually handle */
+			event->u.setup.wLength = cpu_to_le16(w_length);

Alan Stern
