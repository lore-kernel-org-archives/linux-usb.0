Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189772882AB;
	Tue,  4 Aug 2026 06:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785825025; cv=none; b=WslonjwnCX4ZnUVNeJsIAUhaH+4DjOfClubs0EuClh1nuH+oW4tdvTaBIug3KgscmrxYqAumUgPl/GjwJkCqFp5N52nUgQ6eSvWdRwJqvlCa6KYcHnI6TKXdmYM8fBZDj1a2Qmi+WwxKw/QfQ9SiMTpuF1yW62L/JOnQuscrT78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785825025; c=relaxed/simple;
	bh=6Z29UbKd/IJZnvDhbHY1LaXTUBe777tN4SWmdZGZ9Sw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZIxfUfHdeH1a5JHapjr30NgcBjj9VF7UIg+fRRqe3zk8S7ZH6pMwZK4Z+FSnhLmWPgzQxHEHvy21tZfGef07TnydTrmHy5gK3n0LSDNR5arSPrgErevaJbbopGvbiRjpSOmhBdeX8FlKaIMJBIiCFaA5Gug+brAXIVNYXofvy90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cMcToiVc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cMcToiVc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 156781F000E9;
	Tue,  4 Aug 2026 06:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785825023;
	bh=CGZPAqhCeztbEQUfeh4hMQ6TmN0tv0Ajwj6EtaQHmWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cMcToiVcquYyk/vtK2yXFSblx6WjQDEWmtdiVWUtIJgmXeEivvufFGMmg4rbG4SNa
	 0ua3UJc8GgE1c6Dx1Fe788Rz2sIRPw+5yNrPIVhy7wR3ZufmmcbyonwPvMHwxMgXKK
	 cZK1lLKx/PJjeYzI7zwI5NR3aQVwSzE1m1oP0kIY=
Date: Tue, 4 Aug 2026 08:28:55 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rituparna Warwatkar <rwarwatkar@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzbot+54927260acba030187a6@syzkaller.appspotmail.com
Subject: Re: [PATCH v2] usb: gadget: uvc: align XU descriptor pointers to fix
 kmemleak reports
Message-ID: <2026080453-crushed-dolly-04ed@gregkh>
References: <20260804052947.15277-1-rwarwatkar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804052947.15277-1-rwarwatkar@gmail.com>

On Tue, Aug 04, 2026 at 07:29:47AM +0200, Rituparna Warwatkar wrote:
> kmemleak reports the baSourceID and bmControls arrays allocated by the
> UVC extension-unit configfs attributes as leaked, e.g.:
> 
>   BUG: memory leak
>   unreferenced object 0xffff888114fee2c0 (size 8):
>     __kmalloc_noprof
>     uvcg_extension_ba_source_id_store
>     configfs_write_iter
>     vfs_write
>     ksys_write
> 
> The arrays are not actually leaked: they are reachable through
> xu->desc.baSourceID / xu->desc.bmControls and are freed when the
> extension unit is removed. The problem is that struct
> uvcg_extension_unit_descriptor is marked __packed, so these two heap
> pointers are stored at unaligned offsets. kmemleak only scans memory on
> pointer-aligned boundaries, so it never sees the pointers and reports
> the arrays as unreferenced.

So the subject should say "... fix invalid kmemleak reports" as nothing
is really leaking here, this is purely a work-around for a broken tool.

> Unlike the UAPI struct uvc_extension_unit_descriptor, this is an
> in-memory staging structure: baSourceID and bmControls are pointers,
> not inline arrays, and the wire descriptor is assembled field by field
> in UVC_COPY_XU_DESCRIPTOR(). So __packed is not needed for layout
> correctness and only serves to misalign the pointers.
> 
> Drop __packed and move the two remaining scalar members (bControlSize
> and iExtension) ahead of the pointers so that baSourceID lands on a
> natural 8-byte boundary. This keeps the pointers aligned and visible to
> kmemleak while leaving the structure hole-free and the same size as
> before (40 bytes on 64-bit). The bLength..bNrInPins prefix is unchanged,
> so the "memcpy(dst, desc, 22)" in UVC_COPY_XU_DESCRIPTOR() and the wire
> descriptor layout are unaffected.

Wait, what wire descriptor layout?  You said this was NOT on the wire at
all?

> 
> Reported-by: syzbot+54927260acba030187a6@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=54927260acba030187a6
> Fixes: 0525210c9840 ("usb: gadget: uvc: Allow definition of XUs in configfs")
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Rituparna Warwatkar <rwarwatkar@gmail.com>

Did a LLM write the above text?


> ---
> Changes in v2:
>  - Rather than only dropping __packed (which left padding holes and
>    grew the struct), reorder the members so bControlSize and
>    iExtension precede the two pointers, grouping baSourceID and
>    bmControls at a natural 8-byte boundary. The struct stays 40 bytes
>    with no padding, and the bLength..bNrInPins prefix (and thus
>    UVC_COPY_XU_DESCRIPTOR() and the wire layout) is unchanged.
> 
>  drivers/usb/gadget/function/uvc_configfs.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/uvc_configfs.h b/drivers/usb/gadget/function/uvc_configfs.h
> index 9391614135e..049fb9e14e4 100644
> --- a/drivers/usb/gadget/function/uvc_configfs.h
> +++ b/drivers/usb/gadget/function/uvc_configfs.h
> @@ -172,11 +172,11 @@ struct uvcg_extension_unit_descriptor {
>         u8 guidExtensionCode[16];
>         u8 bNumControls;
>         u8 bNrInPins;
> -       u8 *baSourceID;
>         u8 bControlSize;
> -       u8 *bmControls;
>         u8 iExtension;
> -} __packed;
> +       u8 *baSourceID;
> +       u8 *bmControls;
> +};

You can keep the __packed line right?

thanks,

greg k-h
