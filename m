Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 03D157460
	for <linux-usb@vger.kernel.org>; Thu, 28 Mar 2024 20:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711656357; cv=none; b=JjiK2yUZN1qiRf+7Qtx4hoUMlfAH+nwlLk6dPJ58eQTKMwBlb+30amVTzhES3r8qe5bZsN5g7cfEdOd8xpn2YiUUIzX6WLPYzzrbJd1PIWKURxc+UkJC8tuFDJc+imz1BTnLBBQJ1ttVEBedjh0lnIaXydkanRbyxGo/lqYQmRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711656357; c=relaxed/simple;
	bh=NEvX9pFq1k2urOEVK9lj7KFRP0HXKNaKnXe5KjjiMmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rWAN3YJpreZgAIPYQquRRtbJzLSfJS9dkOtw/1S9gZWFslXYdlnBfQYkdBRjv9y1McGscG/z/45g+lmys+xGeDrRLq6dij9lukLSa+A/7S7LqlfO4C2BMb8euZbxPfdkmF5S9X2Xch1p2UlmupUVwk5oOPNfN42cKiGz+p1XdMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 971481 invoked by uid 1000); 28 Mar 2024 16:05:48 -0400
Date: Thu, 28 Mar 2024 16:05:48 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Bitterblue Smith <rtl8821cerfe2@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: Device with two interfaces - what is the probing order?
Message-ID: <8bc3a7ae-bf8a-486e-946b-ff75ef2ac727@rowland.harvard.edu>
References: <f4df8e45-5dc5-4d81-a414-e19a83b71403@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f4df8e45-5dc5-4d81-a414-e19a83b71403@gmail.com>

On Thu, Mar 28, 2024 at 09:08:43PM +0200, Bitterblue Smith wrote:
> Hi all,
> 
> Given a USB Wifi device with two "identical" interfaces,
> in what order are the interfaces probed? Is the order guaranteed?

They are probed in the order that they are listed in the 
Get-Config-Descriptor output.  But this is not guaranteed.

Alan Stern
