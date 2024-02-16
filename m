Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id D4CD512F5A1
	for <linux-usb@vger.kernel.org>; Fri, 16 Feb 2024 15:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708096823; cv=none; b=U9kyMpkTuMCjsYiuXh35curHQKcAZhhoQTdCjFNP4S/bD7IYKNinO17XnfYuBjnHIOIglVSLfQ4L2tHJta3m8+ixIUN6+1DPS84I/HLfVmiwt8qWNapqjlE4rFQstCDkuYNeDxhsITDca8mkaH+XH6QyAJaGgkeMJZHAM4i41yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708096823; c=relaxed/simple;
	bh=GuSP5s6Az7x2HkOAbNvbV9ENIL4oLrnIrZBfC4p2puY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G9X6d1QD928wzOMcyNmh/YcS/VsGbuJIb2viccPIJAsmg8th94sv4T4GCWU/bn1FnBU7rzNb0UeUoBzwmdGbN/4jZmaONvdCZZkCwvGPWoBYS9IOQeDjEYkh5Hf2ku40mcqSxqrKGKRApgDR/SssqacKtIYJCDlw7B8enpAJH8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 465269 invoked by uid 1000); 16 Feb 2024 10:20:13 -0500
Date: Fri, 16 Feb 2024 10:20:13 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: pmenzel@molgen.mpg.de, gregkh@linuxfoundation.org,
  linux-usb@vger.kernel.org, aros@gmx.com
Subject: Re: [RFT PATCH 2/2] usb: port: Don't block port power-off on false
 peer failures
Message-ID: <0fd81580-a01d-48a1-8265-337cfd843dfe@rowland.harvard.edu>
References: <9c53ec38-812f-f701-d2f6-91e28367bb82@linux.intel.com>
 <20240216141230.3924677-1-mathias.nyman@linux.intel.com>
 <20240216141230.3924677-2-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240216141230.3924677-2-mathias.nyman@linux.intel.com>

On Fri, Feb 16, 2024 at 04:12:30PM +0200, Mathias Nyman wrote:
> Several unused ports may share the same bogus location data in ACPI
> PLD tables. This causes port peering failures as these several unused
> USB2 and USB3 ports suddenly match based on their location.
> 
> Don't print the "usb: port power management may be unreliable" warning,
> or block port power-off in case peering failed for two ports with
> connect type set to USB_PORT_NOT_USED.

What if one port is marked USB_PORT_NOT_USED but its bogus location data 
causes the system to think it should peer with a port that _is_ in use 
(and maybe is already peered with a different port)?

Alan Stern
