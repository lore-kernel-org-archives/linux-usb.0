Received: from imap4.hz.codethink.co.uk (imap4.hz.codethink.co.uk [188.40.203.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FDA3191BA;
	Fri, 10 Jul 2026 14:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.203.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783695326; cv=none; b=cV06z+pdR+kfnTFaI2KkT5pE7KmKB91pC7iAV2l+RvomBSQczDjXWizKPpTfqHru/kGtNPallHTUT/tavS6zDpITdZ7809eqPSWcSdi6UKTxMNF81YLkNcyo29wEGKH84wZlqIbqRE/jTYmIyYBhsGe6lJoO60xsTnQyBbsQcOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783695326; c=relaxed/simple;
	bh=UXz8zpzqu1wnbrQyOhB70tDYPVq0UhJsapZq46m+J5g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZKp88Hfao7z/LheKIz5l7QX/SzqOQ+jCG7STlc8iMEL0PwtBOTbaIQtLLyMOThBPJluVwNfFFpHr7ZKIonHhryKgNTP1N2V73dqa5n45rOZ65+eKo8OKvr4rY1ch5agWV72uzhDUsYrViV87Vl4prdqD3hSLJGqtM3ykfOecSTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.co.uk; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=OXPhrC4z; arc=none smtp.client-ip=188.40.203.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="OXPhrC4z"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Reply-To; bh=4Kdyh7o0oTVQQFPPa7prxguUyB1ntRofCBHaIrOJGDs=; b=OXPhrC4zmRNDtuEF
	sMFybQ7JFdScAdnS7Ybh5PXiPZ3ERREmZ1PlOMBIcqfsQVr0nkDeOQbx6P4/xUEcUnUS7l7uIwUMK
	XzR3JdwKp9MugieyyY7utGskBFEztJX5WvCcG1TXV9FrhzCnOqu7Si8WF3e3SvOdtzZKLkyFewB4W
	l/07WSkI9Z2euTrpyQ649UC4oOeoz+EUvv1YVjHXoSGGMMQxgAM9WKbJtqku4RqLXYlb0XLoKInkG
	UDYqxYjvfxwT97SGo34goshHzl3Ylu2rwb/ghfnIpcJoEU47mBoEhnbQtlw5MBUNcmdEKfcAyMjsz
	qe0indw4b8gV5NWtGw==;
Received: from [167.98.27.226] (helo=[10.35.6.194])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1wiCdB-00329Q-T2; Fri, 10 Jul 2026 15:55:09 +0100
Message-ID: <4270e616-a4ff-4543-aee3-44d34c4fe73b@codethink.co.uk>
Date: Fri, 10 Jul 2026 15:55:09 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: gadget: f_fs: fix __le16 of wMaxPacketSize
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Christian Brauner
 <brauner@kernel.org>, Sam Day <me@samcday.com>,
 Michael Bommarito <michael.bommarito@gmail.com>, Kees Cook
 <kees@kernel.org>, Ingo Rohloff <ingo.rohloff@lauterbach.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260617085930.711146-1-ben.dooks@codethink.co.uk>
 <2026061715-rift-strategy-cdec@gregkh>
 <c1108bc0-190f-4ebd-adb2-51a4a07fc144@codethink.co.uk>
 <2026071039-ensure-vastly-73c8@gregkh>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <2026071039-ensure-vastly-73c8@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: ben.dooks@codethink.co.uk

On 10/07/2026 13:58, Greg Kroah-Hartman wrote:
>> dcc03cef0fd8 ("usb: gadget: f_fs: preserve wMaxPacketSize across
>> usb_ep_autoconfig() call")

ok, forgot about this entirely, will send v2 now

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html
