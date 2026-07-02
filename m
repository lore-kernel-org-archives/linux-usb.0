Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22A647CC69
	for <linux-usb@vger.kernel.org>; Thu,  2 Jul 2026 12:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782994819; cv=none; b=RuQLaCnKDTa5JYCn/EcQwhYynC7FIwxvkr1iprh3vnegeOd06aII/zV0EeBd7AnW795/q8Mh0r/RhGl6JbMBZI+dYf5AeCQ8Fp8ThAVt2xamEly8FO/nRemtKeVc4gvx8FKcOH9JPWbwxPbv2mDxJqbsKvYV3kRmRuXdk1VlOEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782994819; c=relaxed/simple;
	bh=tVO+csZXuiy/MGDuKmkIEbISm4SuaOAYVamkOp65NzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qodiHMIGuv4EjcLWJjWvBOOQ3FkJTJTMU206553gdRGRcdCl3kFaZxkyumhZvIN//ay2iFtV/p44RFvU3C/jv2f0hD0EiIUtFtewZIawpEong3EETp28irfsNM+Fop2baSXHq9eNflbo/TjXwEpVkWhVqRmnkRrbcBBRtMJrUT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=m/iFpz8x; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="m/iFpz8x"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4grbYn34f9z9vJL;
	Thu,  2 Jul 2026 14:20:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1782994813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r10KRUJd1xILBqr+aiwsEJnzWoHhKN62eraV3D+KUiM=;
	b=m/iFpz8xNGqkkZSlx6vt6MyhxOtJnmRNNek9dKkw+qlWJb1MKHB4UKnAZAqU6dN81Z3+kp
	4Olu/bslTsJbnU2Est1rc1IKHIudJFJ6Y2CprRomCZUmnJgRyKDRlsgsCGKpaQ5/9+/h3Z
	51m88XCFnvPm5DzhzA6BDhmOz0YWHKcqgzMwdyf18xm12MfIheZCHRyKZ0mF737G0Unz32
	dblNRBKNmaZz/Mn3NLTb0drwcIjOiKfQsLMQLgxQQ6it563pL0CwHEuQyORhkORI97qSLW
	yiEbySSX620CSn3Flt0qbRjIWpac+9ps6AXsYJTeFBI7+Rp64jpm4o8aFYSnAg==
Message-ID: <80bdd3da-33c0-44b4-a1af-6aca44c1acd6@mailbox.org>
Date: Thu, 2 Jul 2026 14:20:05 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: 7.1 regression bisected to "usb: core: Fix SuperSpeed root hub
 wMaxPacketSize"
To: Michal Pecio <michal.pecio@gmail.com>,
 Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
References: <cb287e3d-3066-4820-b464-6208b947974b@mailbox.org>
 <577c7ba6-c638-4e73-acac-fbf6c4fb4ccc@linux.intel.com>
 <20260702105152.415afeaa.michal.pecio@gmail.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: de-CH-frami, en-CA
In-Reply-To: <20260702105152.415afeaa.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: f8ce69c55560b814a5e
X-MBO-RS-META: 54fybr3uxesmdn5uxffguw9ma9fcbz57

On 7/2/26 10:51, Michal Pecio wrote:
> On Thu, 2 Jul 2026 00:09:42 +0300, Mathias Nyman wrote:
>> On 7/1/26 19:02, Michel Dänzer wrote:
>>>
>>> The ethernet port of a Lenovo ThinkPad USB-C Dock Gen2 connected to
>>> a ThinkPad P14s Gen 5 AMD stopped working in 7.1.
>>>
>>>   ip addr show enx482ae347e7c3
>>>
>>> says the interface doesn't exist. The only thing about it in dmesg
>>> is:
>>>
>>>   r8152 8-1.1:1.0 enx482ae347e7c3: renamed from eth0
>>>
>>> In previous kernels, dmesg had more lines about it:
>>>
>>>   r8152 8-1.1:1.0 enx482ae347e7c3: renamed from eth0
>>>   r8152 8-1.1:1.0 enx482ae347e7c3: carrier on
>>>   r8152 8-1.1:1.0 enx482ae347e7c3: carrier off
>>>   r8152 8-1.1:1.0 enx482ae347e7c3: carrier on
>>>
>>>
>>> I bisected this to d1e280334b7f ("usb: core: Fix SuperSpeed root
>>> hub wMaxPacketSize"). Reverting that commit on top of 7.1.2 fixes
>>> the issue.
> 
> Incredibly bizarre, I wonder if it's some userspace madness.

That reminded me that I'm using (an older upstream version of) usbguard. Unfortunately its GUI notifications when it blocks a USB device aren't working reliably currently.

Manually firing up its settings app revealed that it was indeed blocking the USB3 hub. Overriding it to be allowed fixed the issue with the bisected commit.

Looks like a false alert after all, sorry for the noise, and thanks for the help.


> If not possible, please at least post ordinary dmesg. Even if there is
> nothing more about "enx482ae347e7c3", there might be about "8-1.1:1.0".
> The snippet above is a small part of typical r8152 connection log.

FWIW, the only other message about 8-1.1:1.0 is

 r8152 8-1.1:1.0 (unnamed net_device) (uninitialized): Invalid header when reading pass-thru MAC addr

which is a red herring, since I'm not using the MAC address pass-through functionality.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
