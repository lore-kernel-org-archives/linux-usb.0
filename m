Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C62426693
	for <linux-usb@vger.kernel.org>; Fri, 10 Jul 2026 11:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783684792; cv=none; b=W0sh1lw2/F9H57CSwC5sioLyzlPlvFyF+n5UYLHPAVplkEAcbUOu2/alDHiUfLjBVOfpmSwbuKIgDEaEd/L38I/MYGuoeOoaLaj9jT56xXVCKtQ37tKqohyYRKpttJs5ox5YUpwq7OEpz1p6NuhZjt/kqeqjex87dFs6/ya190A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783684792; c=relaxed/simple;
	bh=64/Ao4+W2gWE9MoXAH5L7UH8K/AlS9+Fe5ID0rtoExA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I3OnTBBBdxJRmYR8ZPBM9ve0gDxe2FpLrplpersmSDnuJspvTjYpQEVoKYfjyMZpy2Rof4nrTEIiX4Bd24ZUyAR58OJo1XOV1F3nUva901WDl6xQXEmemGR+Go5pDqGEnff5OlIksmtRt6ZmTMIR2aooVDCZInAm/ZKWkBWV69E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GfrYooE2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GfrYooE2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 754F01F000E9;
	Fri, 10 Jul 2026 11:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783684790;
	bh=jL105cwMhNyw7WYfISTxJidZXDhMZjhNWesn3VczNEE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GfrYooE2bi7Hq9Hx0DmTvreXH+j3NbwFXI1P7H+66bh5LhU8Rn8CUgU+dgdz5RiDc
	 jkFmg9Trl9nYqpdF/gsbIFzy/sEJscgogFYvVJQbQxqUp+TbBCODrKGNj1b+AJNpGJ
	 s2WMkGGHghx/8yNLlsbW+klOnE9L4r1DBm+k1vQk=
Date: Fri, 10 Jul 2026 13:59:46 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Trabajos Iafast <trabajosiafast@gmail.com>
Cc: linux-usb@vger.kernel.org, heikki.krogerus@linux.intel.com
Subject: Re: UCSI: no connector change =?utf-8?Q?ev?=
 =?utf-8?Q?ents_for_connector_2_on_Lenovo_Legion_Pro_7_16IAX10H_=28Arrow_L?=
 =?utf-8?B?YWtlLUhYKSDigJQ=?= port functional in Windows
Message-ID: <2026071024-zit-pretender-1bb8@gregkh>
References: <CADvEaBJnc49dyCNTbe8ys4G4HhEKpMFyjm7xE74evxFodYFb-g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADvEaBJnc49dyCNTbe8ys4G4HhEKpMFyjm7xE74evxFodYFb-g@mail.gmail.com>

On Fri, Jul 10, 2026 at 06:25:08AM -0500, Trabajos Iafast wrote:
> Hi,
> 
> I'd like to report a UCSI issue on a Lenovo Legion Pro 7 16IAX10H
> (model 83F5), Intel Core Ultra 9 275HX (Arrow Lake-HX), where one of
> the two side-mounted USB-C ports is non-functional under Linux (no DP
> Alt Mode, no data, no hotplug detection), while working fully under
> Windows 11 on the same machine (dual boot).
> 
> System:
> - Kernel: 6.17.0-35-generic (Ubuntu 24.04.4)

That is a very old and obsolete kernel, can you try the latest 7.1.3
kernel release instead?

thanks,

greg k-h
