Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E305C4183AE
	for <linux-usb@vger.kernel.org>; Fri,  5 Jun 2026 15:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780671799; cv=none; b=FssISuvR0J/xQG7fJrAkj0sDXDQf5RjVWr8R0Bu/+wtERl4u/f7OZJPMZGqDmkjHcYec+m2R0FDjasdkUx7atFCc1ol+0410v2EpquIR7JyI3VXNZaTaLBLCgVQ1fkNNpGcc3hNWvh9U0AdLC6HxmU548ROzzFzK29wCH6NCccU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780671799; c=relaxed/simple;
	bh=G6x+e0pDg3YCGAERnb0DFO5RZkClItCyLerDFW18aNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TZLFsKXycLFrOr1wTkz9MSxs5mImnYQ6g4sGZbN9SHQmanY1LFxGs1IJ8Sf/PzRxUKiJcDAQlGMb+2rtHQlCxl5sDB8BJ7I5uzjX59m8iHHo+dv+ur0jIee1fJ/QJoTzsjTAKSCamRyz/SDUixHm9iQ2WbNMc92bAviG3WFzTIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=umQvZtnf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="umQvZtnf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47EBB1F00893;
	Fri,  5 Jun 2026 15:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1780671798;
	bh=YcSL9VIpTAV4A74fdsdcI/OQgAJoq3zsED7IbZORToY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=umQvZtnfe+L1KQwi28A5jOOaZLAxa8IgdWIzR6C+nxsQHh20Qn+9J8n/Nar9ckbyA
	 4f3/eMnlEKn/7gQGZRNDet9rojwnrNt7y7ZI/4oMK3Fu3x2DQ2hiPcsI2nHeku1syt
	 Mkg5ePcfwBHKxFt6GaxuTAIVcNOqdme9QMk6OKzY=
Date: Fri, 5 Jun 2026 08:15:25 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Johannes =?iso-8859-1?Q?Br=FCderl?= <johannes.bruederl@gmail.com>,
	linux-usb@vger.kernel.org, A1RM4X <dev@a1rm4x.com>,
	Vyacheslav Vahnenko <vahnenko2003@gmail.com>
Subject: Re: [PATCH v2] usb: core: add USB_QUIRK_NO_BOS for devices that hang
 on BOS descriptor
Message-ID: <2026060544-roundup-mobster-8fcd@gregkh>
References: <2025120708-header-startling-ffaf@gregkh>
 <20251207012059.7899-1-johannes.bruederl@gmail.com>
 <20251207084012.7c232e52.michal.pecio@gmail.com>
 <CAP=XvD+dNNDj75DYjjByE3o7F8i-QxusAdz-5+hG24fCesWYRw@mail.gmail.com>
 <20251207104505.1d5f3718.michal.pecio@gmail.com>
 <CAP=XvDJJP2orxYcgiKzp0FrQE2UMiXndZe8Z6BdBRFvkujWu5w@mail.gmail.com>
 <2025120748-extras-retrain-16eb@gregkh>
 <2025120846-nearby-breath-e5fe@gregkh>
 <20260604165619.592c4e24.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604165619.592c4e24.michal.pecio@gmail.com>

On Thu, Jun 04, 2026 at 04:56:19PM +0200, Michal Pecio wrote:
> On Mon, 8 Dec 2025 06:12:15 +0900, Greg KH wrote:
> > Ok, I can duplicate this here.  Maybe we just don't ask for the BOS
> > descriptor if no one needs/asks for it.  I can play with that later
> > and see if that helps as I'm sure this isn't going to be the only
> > device that can't handle the BOS descriptor if Windows isn't querying
> > for it, so we don't want to make a huge quirk table if we don't have
> > to.
> 
> Hi Greg and others,
> 
> The workaround is now in, but if somebody is interested in getting rid
> of it, it might suffice to make kernel BOS requests more Windows-like,
> since these devices work fine with Windows (and Windows queries BOS).
> 
> By monitoring Windows 10 in a VM I found two key differences: Windows
> fetches BOS *after* the configuration descriptor, and it requests 255
> bytes at once in its first attempt (there is likely a second attempt
> if BOS length exceeds 255, but I don't have such a device to test).
> 
> Any chance that the change below is enough for these video grabbers?

Have you tried it?  I'm away from my device for a few more weeks and
can't do it myself.

thanks,

greg k-h
