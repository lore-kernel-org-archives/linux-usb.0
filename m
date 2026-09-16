Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E5C3FC5D3
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 13:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789565172; cv=none; b=gaFx5EuffgSCVV1RK6BQlkADcqzYLwb5t3xVFkInZMPWGNXdOwl77+fWaFTZuo+KNprUalI8xG3BmpnuzgwIOrDFdVPjcUrOQ/vGNK/W9OzKPbW5lZy+cWtlzpyNafazoApbD3cqrqsjHKXJe72q6ZF5Oi3iArSzmLsZaYj6cFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789565172; c=relaxed/simple;
	bh=W72a4LOjc25yieDLSbQN59cuiSACq2hX1GpjpuFEhP4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nSSARKSIXYYY38heLuKp2QWQH9tJ+pexYWgsCq//tArYp6+RvVOw16odTC+MFZE9gyMNochmu6da8dYnqSeuOHX8ejjZ9ChKVcug0kYxoxNkKG+/vPTlGIRxNP/H7eE5a5aMvqCoDf9BzwSK9KmSx1Gs/d8LlqBlPpIQnbsdz/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mm+lLS0e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mm+lLS0e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86C151F000FF;
	Wed, 16 Sep 2026 13:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789565169;
	bh=O4ykET6ACjqoz6BJLVw3jShejNOTPsjlDHBgIRm6guA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=mm+lLS0eVYSbpt9T80ZcKz8bXEv9zuwcgavXN620ybJq1hf8gRTqu/FCKY1MwUqu3
	 9Mv9uRrApHiZEWn9ylzxDnSXLoEIXTPjLV1pJFtK/SRNl11rmVzJPYhqJCkFdU2EJH
	 Gk4vOPMnEsxJgZrxqVS9tiJ3+phFAzqwEkZ5RquwSTfJaPr3k258g+2iTTRr4O7534
	 k+AJWR0Hqt+xyHuNQHaBw1eg040m81nAD+QN/UogKGFmIkDh1ueZMJZJfUBxPL5+ua
	 e+v5UBVr6LLOBa/iWVH7CMvA2Nre3h+OKgZv/oDKecwp5lktMc55JngihX6Q6xdIyy
	 auhDbcwBsipow==
Message-ID: <70a3162e-aca7-44b0-9896-423dd8071838@kernel.org>
Date: Wed, 16 Sep 2026 08:26:07 -0500
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: AMD Strix Halo USB4: 20/40 Gbit/s negotiation with RJ45 and
 original host-reset patch regression
Content-Language: en-US
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Nils Arnold <ns.arnold@web.de>, linux-usb@vger.kernel.org,
 Sanath.S@amd.com, Basavaraj.Natikar@amd.com, westeri@kernel.org
References: <a3437a3c-cf2a-4034-ae1f-0fb4bad0197b@web.de>
 <20260915124904.GK106095@black.igk.intel.com>
 <853b62e8-5b07-43d2-be93-bfbd95f55165@kernel.org>
 <20260916073839.GL106095@black.igk.intel.com>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260916073839.GL106095@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/16/26 02:38, Mika Westerberg wrote:
> Hi,
> 
> On Tue, Sep 15, 2026 at 03:42:43PM -0500, Mario Limonciello wrote:
>> On 9/15/26 07:49, Mika Westerberg wrote:
>>> Hi,
>>>
>>> On Tue, Sep 15, 2026 at 01:21:39PM +0200, Nils Arnold wrote:
>>>> Hello Sanath, Mario, Mika and Basavaraj,
>>>>
>>>> I would like to add test evidence from two Strix Halo hosts to this
>>>> USB4 reset discussion. My reset test used a backport of the ORIGINAL
>>>> f1de1fc5f632 commit, not the newer deferred-reset implementation.
>>>> I have not tested the revisions discussed on September 15.
>>>
>>> Okay the last message on the thread I asked if we should revert the commit
>>> for v7.3-rcX and then try to get the "better" fix into v7.4. At least what
>>> I understood it seems to solve the issue without the deadlock and killing
>>> the whole host interface underneath everybody else.
>>
>> FWIW to Nils I left a note on that thread and agree with Mika.
>>
>>>
>>> Once we have that patch, you can test and see if that helps in your case
>>> too. Now that we know AMD guys can CC you when they submit it.
>>
>> One thing I'd like to note though; I would rather that we keep out of tree
>> modules out of the conversation on the kernel mailing list when it comes to
>> upstream behavior.
>>
>> There are multiple ways to do xdomain tunnels in the kernel, and we should
>> collectively fixate our time and energy on bugs related to those instead of
>> PoC out of tree drivers.
> 
> Fully agree. But the same behaviour is with the in-tree Thunderbolt
> networking and stream (and maybe DMA test) drivers so those should at least
> be working with the AMD controller without wedging.

Yes and no.  That out of tree driver might be configured as a module, 
but at least I haven't audited it.  It could be causing other problems 
too when it accesses certain symbols.

For our own sanity I suggest we work with those in tree drivers and 
untainted kernel.  If the problem can reproduce with those we can work 
on fixing it.
