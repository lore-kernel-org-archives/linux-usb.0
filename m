Received: from imap4.hz.codethink.co.uk (imap4.hz.codethink.co.uk [188.40.203.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1822EEE84;
	Mon, 13 Jul 2026 06:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.203.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783922452; cv=none; b=oHnRkoOKAxzOi+RIssmaixZdVywcTWQXm/eBk8x2QUeLTWX0GUHWvsUjjamvzNZ/bTw045YdhGe3vEjXrbfgaUmb91E5QJhVij+fN5gIS1WHrz9tJIUGiMMbe6WCI+HNyGZauYuLOjJ4TNGEgaTQHiCoFYJENNChAC+HilPT3IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783922452; c=relaxed/simple;
	bh=cQpCH7NudmK8sP2giPII58DAJ9CPPxEK6Lh3hE+lAls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KoFlBzhHL44DSECPR1RxxW9IRD1X5rzszwMuziQvcrN6QFnxDNXb8+q9OWFfrqfReUHxGsjzxB1NNU3UtCGFOfQC56z2lGgyoms45AeZ0tSep7EURKN2QCEKLykTyIbtK+gS5EzdzR0D8OufT27ee+gecWKQDVQIR/hGx1VgSDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.co.uk; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=lptO3yGm; arc=none smtp.client-ip=188.40.203.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="lptO3yGm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To; bh=ItJB/AGXSCgmLb3Qfmy3RWKFLT/jJOgpEikImlXbow8=; b=lptO3yGmzHEu28Hm
	C6nZcpyHEHtkVUGbP38xDSlQZLONl7OziKMUcYp2D3yrPHmQ8lUJfVkInxDQphz4AnRu6Fq+PXe13
	991f9cIclvCg2uGzHM96g7hq+dKBCxqrlWIgIQt5SU2+F4g9ZiUgt9lFXDIhjBEU5zYNkwMLLxkaW
	AAtgEobdRnNAj+fNeH1Snxcdil7uwrn+kE+gmJ2PnB6KCHc/vJ5hFB8A85tFam6yIlYsjgNl63Dlh
	zPX1c5KLzLHTh+Df5JnjGI2dTPGBk2HcAyLRaVslZDT96zRD1fssnVotLueQizHNxPSxJTgDuM40a
	RPtnAgAy2p/Qb2KaVA==;
Received: from [167.98.27.226] (helo=[10.35.6.194])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1wj9iR-0063V0-I7; Mon, 13 Jul 2026 07:00:31 +0100
Message-ID: <9f7cbd43-16e1-495e-8f56-9bce8fa5e437@codethink.co.uk>
Date: Mon, 13 Jul 2026 07:00:30 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: gadget: f_fs: fix __le16 of wMaxPacketSize
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>,
 Michael Bommarito <michael.bommarito@gmail.com>, Sam Day <me@samcday.com>,
 Kees Cook <kees@kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260710145430.501893-1-ben.dooks@codethink.co.uk>
 <2026071124-gracious-spry-9b7b@gregkh>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <2026071124-gracious-spry-9b7b@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: ben.dooks@codethink.co.uk

On 11/07/2026 06:09, Greg Kroah-Hartman wrote:
> On Fri, Jul 10, 2026 at 03:54:30PM +0100, Ben Dooks wrote:
>> The wMaxPacketSize is __le16 type, fix the sparse warnings by changing
>> the type.
>>
>> Fixes the following sparse warnings:
>> drivers/usb/gadget/function/f_fs.c:3346:32: warning: incorrect type in assignment (different base types)
>> drivers/usb/gadget/function/f_fs.c:3346:32:    expected unsigned short [usertype] wMaxPacketSize
>> drivers/usb/gadget/function/f_fs.c:3346:32:    got restricted __le16 [usertype] wMaxPacketSize
>> drivers/usb/gadget/function/f_fs.c:3371:36: warning: incorrect type in assignment (different base types)
>> drivers/usb/gadget/function/f_fs.c:3371:36:    expected restricted __le16 [usertype] wMaxPacketSize
>> drivers/usb/gadget/function/f_fs.c:3371:36:    got unsigned short [usertype] wMaxPacketSize
>>
>> Fixes: dcc03cef0fd8 ("usb: gadget: f_fs: preserve wMaxPacketSize across  usb_ep_autoconfig() call")
> 
> This isn't a valid git id :(

Looks like the b got dropped off the front during copy.

Fixes: bdcc03cef0fd8 ("usb: gadget: f_fs: preserve wMaxPacketSize across 
  usb_ep_autoconfig() call")

commit bdcc03cef0fd8abc6eaeec6ac47e54ae8f8c625f
Author: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Date:   Thu Jan 31 15:53:40 2019 +0100

     usb: gadget: f_fs: preserve wMaxPacketSize across 
usb_ep_autoconfig() call

     usb_ep_autoconfig() treats the passed descriptor as if it were an fs
     descriptor. In particular, for bulk endpoints, it clips wMaxPacketSize
     to 64. This patch preserves the original value.

     Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
     Signed-off-by: Felipe Balbi <felipe.balbi@linux.intel.com>



-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html
