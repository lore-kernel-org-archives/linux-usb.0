Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792213DCDBB;
	Mon,  8 Jun 2026 15:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780931491; cv=none; b=PHzmMOW4XJ45cAvJsyuobqzlA0Tyoy4mMQsp9OjOHA+snhUBL/tKKs3sZ0dL+fG58i6NfiiQI348Sicinqf8CV3fF2QbV75tTdzVqBPptVj71uBHyZgenMK8RtIZDQqvCqtuB5CYEVVJp8Bd9zWq2AKuGrveAjW0LdrT2eunkcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780931491; c=relaxed/simple;
	bh=N5f4HRtNKrpnqffyG5/iugv+osaIyyeonCXK3aWEUGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iii55FRIwnVLixci2Du0MG9z8cZqNdvM4lLDez48cK/jxVGgxRzI7wo+U1o7HdQnKPiJcgE4snp2YtHlFsxp3Hj5b/lioaNHIWh5//4C5dF1nNVQHkhJJhD4oNYprdjU6N1xa6Az/WwBZv060H5H8sQGh+0vwWWJE8bE4yotGso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e+r5NLnc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e+r5NLnc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FEE01F00893;
	Mon,  8 Jun 2026 15:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780931489;
	bh=3FLe0vLg0wwJ/8D/ZbOFctox4UB1snk+sSL2A9vQ5MI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e+r5NLnck84M7SsJswKU+VOLVYfUDHeCfHqXXDQyMHSBSrSOrKUM5Dh01BFMj+rXl
	 noL6UNb6UQh5wSIAK2RGNAIJyiRhdAJgkRmy1EnFBwgoy9yc1Hf0174KIW28McmoUO
	 gouPqZfPfEqlNg1oMNoCR3cIvUO6XhgNnGwrO/T/mmjRhiawITRnxHKidcDvxOBRXL
	 VsJNl7smF3RCrBmFTlicxWVBvLpOE2Or6093vgXAcCVZ02ual6pn6RXET1u67hNKjq
	 u6w4UKQ8Ujzg0m95P2a5cGinB4WfJm1pQQcEWCe46cFnFJ9a+l1ONmxP/KU1c4Pt14
	 sVeDTrKeDC1XA==
Received: from johan by xi.lan with local (Exim 4.99.3)
	(envelope-from <johan@kernel.org>)
	id 1wWbdP-00000000IKZ-1EJj;
	Mon, 08 Jun 2026 17:11:27 +0200
Date: Mon, 8 Jun 2026 17:11:27 +0200
From: Johan Hovold <johan@kernel.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Oliver Neukum <oneukum@suse.com>,
	Shuangpeng <shuangpeng.kernel@gmail.com>, keithp@keithp.com,
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [BUG] KASAN: slab-use-after-free in dev_driver_string from
 chaoskey_release
Message-ID: <aibbn1858ZUIq6Fq@hovoldconsulting.com>
References: <20EC9664-054E-438B-B411-2145D347F97B@gmail.com>
 <257eb882-44dc-4e25-82f9-9cf9b455936d@rowland.harvard.edu>
 <2a50158f-34ff-41ae-8899-ba2ec6d550b3@suse.com>
 <67613cb1-acaa-4870-93ed-95a282a74f06@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67613cb1-acaa-4870-93ed-95a282a74f06@rowland.harvard.edu>

On Mon, Jun 08, 2026 at 09:29:23AM -0400, Alan Stern wrote:

> You're partly right.  Both my original patch and yours ignored the fact 
> that the driver takes a reference to the interface structure.  That 
> reference isn't dropped until chaoskey_free() runs, so the only 
> debugging statements that need to be removed are the ones following 
> calls to chaoskey_free().

> Index: usb-devel/drivers/usb/misc/chaoskey.c
> ===================================================================
> --- usb-devel.orig/drivers/usb/misc/chaoskey.c
> +++ usb-devel/drivers/usb/misc/chaoskey.c
> @@ -248,7 +248,6 @@ static void chaoskey_disconnect(struct u
>  		mutex_unlock(&dev->lock);
>  
>  	mutex_unlock(&chaoskey_list_lock);
> -	usb_dbg(interface, "disconnect done");

There is no need to remove this one as driver core holds a reference to
the interface until after disconnect() returns.

>  }
>  
>  static int chaoskey_open(struct inode *inode, struct file *file)
> @@ -320,7 +319,6 @@ bail:
>  	mutex_unlock(&dev->lock);
>  destruction:
>  	mutex_unlock(&chaoskey_list_lock);
> -	usb_dbg(interface, "release success");
>  	return rv;
>  }

Johan
