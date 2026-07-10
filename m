Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9329A329C60;
	Fri, 10 Jul 2026 13:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783689068; cv=none; b=rtfE/90FzgOvpx4FPgmxavNm0AkBoezDQ/ZXOBw5nEsSb13/z7KImVdadUt88YQQEs9TSOa8WsM9z8TbivIstTrpiaQFBxPbK2lnDNdATONDLs1xuiQrgdQqpY101lulmIF3W7ysh/rT36ZvqKuwxcq74ktsac38uhu97nS0JEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783689068; c=relaxed/simple;
	bh=4JZlfHoloyzU1T3e6APGZI0okU45dpYDTNGfcgFIRaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l6wW9SFB87+LYaj5xLF3KaYa+MaBTcjWd3/kjhDmnigVtfYc0WJJh8V6Ur/HlitsG2YWx7HZCYKWSAB6cjzQ2ZvxoZaC3D1Zncjc1+nO7GdHURJdVHHSx00U4G27tBpbR635Pl2Gt8wyFztdpcKmLdSjyHUsboUdsXcosYWlm50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=tW0dodXY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tW0dodXY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DBDD1F000E9;
	Fri, 10 Jul 2026 13:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783689067;
	bh=DNiCOuV/RLKFPQbbxHScZMxDrjPwfFgH3aMF3SvyiaU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=tW0dodXYg6YH/pKpXc6oxmrpZgKbVYgBSttLw98poZDY8rj7H1lXBwWoxL5BOkeeH
	 dXs0aH8lCNBatSXpkdZJTM7FlXPT2tJHh7gRL4pLp/l2KtjzavcpV9GoHEA/hT16gx
	 3dy6K3a6YbO5cL5q1X3x7708yXjexVa/pUvg8XIk=
Date: Fri, 10 Jul 2026 15:11:03 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jad Keskes <inasj268@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: misc: cytherm: replace deprecated simple_strtoul
 with kstrtoint
Message-ID: <2026071040-attire-bounding-6539@gregkh>
References: <20260622123124.2380612-1-inasj268@gmail.com>
 <2026070803-capable-economic-d54c@gregkh>
 <ak5pje51q2PLEAC-@fedora>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ak5pje51q2PLEAC-@fedora>

On Wed, Jul 08, 2026 at 04:20:03PM +0100, Jad Keskes wrote:
> On 07/08, Greg KH wrote:
> > This changes the user/kernel functionality, are you sure it is safe to
> > do so?
> 
> Nobody writes garbage to these on purpose, and if they do by accident
> they should get an error, not 0.  The only way this breaks is if some
> tool depends on "echo foo > brightness" silently setting to 0 — which
> would be a bug in that tool.
> 
> > What is wrong with leaving the current calls?
> 
> simple_strtoul is deprecated per deprecated.rst.  It ignores overflows
> too — writing -1 wraps to ULONG_MAX then gets clamped to 0xFF instead
> of erroring out.  kstrtoint returns -EINVAL for both.

Sure, it's deprecated, so don't add it to new code, but for existing
stuff, don't change how user/kernel interactions might work.

thanks,

greg k-h
