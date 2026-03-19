Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351163D3CE6
	for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 13:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773926408; cv=none; b=CWuHQBu2a3rGAkWZDepUCS4ACskVV+ugXvpNBof7t3xYA74B06Scyb6l3hzLNJTzawZGFyw/8JKq3Xur+c5mGBe5OGLm0v3eTxlghf3uBFJfzB3tXYlTOTt+2CD9iNa8o96YSdu6G1u1W1q0HGhin6LdEe4uuVe6C78FHMfWaJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773926408; c=relaxed/simple;
	bh=McCAiLV/U3tjSVOhlenojRvi6Z9Lo58JFmh+qv3Zj5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nqT6YfTChmGacGOKwVadTMx/yAdOBIXM2xc0DV4YqjGd57ZCbH2dDx9DHbBB7g1QEm5KLeccFwLK1cjBTzcRzQkfjNAJJpRATWdTfp8y+nlbm0vWrOjnZWqU/ZeFwbwyRf6X4smsl7gqXGjpk2Py6O4i9pH8ipJUY2fHQo/FB60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jWbB82eC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jWbB82eC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B70EC19424;
	Thu, 19 Mar 2026 13:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773926407;
	bh=McCAiLV/U3tjSVOhlenojRvi6Z9Lo58JFmh+qv3Zj5M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jWbB82eCiSWWJS6O268mePYOr8cyPS6OFXiPB6qpm4LF+qLjdCKwYMZKoWWAvOIP7
	 sz58mhmIwTJMbsnzn1LHvYzOIe28MviTK3T5n0rSK15KtQOdEigYIO6KE5hM/nwywF
	 LsS8tg3S4PUIdVkkG77IFHxgJuv3cU8hxxJTjNYQ=
Date: Thu, 19 Mar 2026 14:19:58 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Oliver Neukum <oneukum@suse.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/2] USB: uapi: add BULK_MAX_PACKET_UPDATE
Message-ID: <2026031932-upscale-thirsting-1be8@gregkh>
References: <20260317092244.1464921-1-oneukum@suse.com>
 <20260317092244.1464921-2-oneukum@suse.com>
 <2026031809-wobbling-sedation-1208@gregkh>
 <ab1c2aa5-5037-4583-8c07-57385e0ca42b@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab1c2aa5-5037-4583-8c07-57385e0ca42b@suse.com>

On Thu, Mar 19, 2026 at 02:06:02PM +0100, Oliver Neukum wrote:
> On 18.03.26 16:10, Greg KH wrote:
> 
> > Should have USB_ as a prefix.
> 
> Roger
> > And what is 7?
> 
> I have no idea. These things have becomes messy. As
> you can see some values have been used twice and
> sometimes we use USB_DEVICE as a prefix and sometimes USB_DEV
> although both are for devices.
> 
> I can try a full cleanup, if you prefer that.

We really can not change things we have exported to userspace here, so
we have to live with what we have, sorry.

thanks,

greg k-h
