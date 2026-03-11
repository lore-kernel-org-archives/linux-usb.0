Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B4C3BD22A;
	Wed, 11 Mar 2026 08:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773216135; cv=none; b=Ts5ikrpVw6na/4SXcvmcMAZji+GfR4jl9J/SjgfIlQfeCAUFtXs+EhxmQZV5ygbsHa7WE6oRkI4SEPi6SWfnOxjo+S1TSe97WhqXeGj9UegaknviCK+kjsX1z4/kbmMjx7WQ8gD4EcvlUBiT+j2/+0ghAa/AG98mJ40gt6ecIGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773216135; c=relaxed/simple;
	bh=n8A54UbdN3Qk/1oFVDqa88G4ckLRtwTE0EURVB8GS6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fze2R4btrufugN68iQlj04FbZEf/DG/r+zrV1GsQuKOiWs1YsytgBLvyTzOIAb1S4cpCIy6E9ag1uOa/IxR8BedKFPxU+dl2Tot4x99xkKKyxueFeCYh8GJPa43oBsl9TsFZpJS8E0JF3wMPfY764J1YRLtu7gTbFXEGY7dRTt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UDUR+vfk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UDUR+vfk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 765A5C4CEF7;
	Wed, 11 Mar 2026 08:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773216134;
	bh=n8A54UbdN3Qk/1oFVDqa88G4ckLRtwTE0EURVB8GS6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UDUR+vfknVq6HyVH09NZyfc8nto+ikvEoc2rMhH6zJnkOs4YxT0TvltpsIaD41cpS
	 lKlBV+EbyLmQulLzxyLs4XPPsi9IBtimy2oIwxbjJrj7Saus4kuf5XFZBvVY7mSqiJ
	 sl1eTJ3MXlKV4P23Bf1nLGqN3nf2DZI3w5R/s2Za09FMZBSsyJAJNG0xZEVMKzTpP4
	 BIwAwdJ5O/trTGPOfMau+HXDxBoT+JDZJXRu7kyxLwGveYfRrUiTOE5DLIaNJsaPs8
	 /d3PXfpOCuFLosEED00bkLui5RBLEUceQzWTJmK5uwVVHS+ONvrURY8gspi+HPQJUs
	 7hkTysK+lCimA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1w0EWB-000000002Vk-3a8J;
	Wed, 11 Mar 2026 09:02:11 +0100
Date: Wed, 11 Mar 2026 09:02:11 +0100
From: Johan Hovold <johan@kernel.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bastien Nocera <hadess@hadess.net>,
	Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] USB: usbip: drop redundant device reference
Message-ID: <abEhg-n_mpucbUbg@hovoldconsulting.com>
References: <20260305133851.2952-1-johan@kernel.org>
 <20260305133851.2952-3-johan@kernel.org>
 <9d727cd2-701e-4c5b-9646-82874f2d0a4a@linuxfoundation.org>
 <aa_X1qNsCGll04zj@hovoldconsulting.com>
 <55fcc500-afa5-4ee7-bde8-c5eec6932764@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55fcc500-afa5-4ee7-bde8-c5eec6932764@linuxfoundation.org>

On Tue, Mar 10, 2026 at 03:51:41PM -0600, Shuah Khan wrote:
> On 3/10/26 02:35, Johan Hovold wrote:
> > On Mon, Mar 09, 2026 at 02:26:03PM -0600, Shuah Khan wrote:
> >> On 3/5/26 06:38, Johan Hovold wrote:
> >>> Driver core holds a reference to the USB device while it is bound to a
> >>> driver and there is no need to take additional references unless the
> >>> structure is needed after disconnect.
> >>
> >> In this case it is necessary for stub driver to hang on to the reference
> >> to maintain exported device status.
> > 
> > But the driver does not hold on to the reference taken at probe after
> > disconnect returns. The stub device itself is even freed at disconnect
> > and cannot be used to release the reference.
> > 
> > Which exported device status are you referring to here?
> 
> I am referring to the device status that usbip host exports to
> the client side. The interaction between host and client is
> handled from stub rx, tx, and also event handler.
> 
> Having the reference to the device helps so the device sticks
> around until the stub driver no longer needs it so we don't see
> use after free type issues.

But the driver drops the reference that it takes during probe at
disconnect, which makes that reference completely redundant as driver
core guarantees that the device won't go away while a driver is bound.

So that particular reference doesn't help with anything.

Johan
