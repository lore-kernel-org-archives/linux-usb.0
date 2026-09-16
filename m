Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4823E7174
	for <linux-usb@vger.kernel.org>; Wed, 16 Sep 2026 13:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789565799; cv=none; b=fU4AueW/1OXe3dato2DhUWbwuVqCDGzMcxKZK8zeQPoBlLjIEU1QrdBqGKKzyDE51EfSHIorctBk6uiMe8gUiON/jEOXxPlPXmizTdiqRwV91FB3MV9Mz4GWp4EciFZnGj6yeImzOQJOGngCDFNCNWDHxoLjfkha3g7DYxObL5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789565799; c=relaxed/simple;
	bh=6IPGjiQEUJIIuK0aM6PJeTeVkWSgSV6E4g2h3MaKVL8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qd4ndk3XBllGKdNPmtNFYg5Twqc5rFYYNu7XZNY9DqgTQEYEA0j9pX5edG2O/n0JkYkWNqClbrrafcg4sti1gOUXMeXVHYJSw3WlJs2gWfSIGI0K5F1YvsCMSJVt75EwQVTdZU8JFv0N9Oe4j6GCpZDOkojMe7xbjFxJ1V8dRLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b+JTn199; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b+JTn199"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B821D1F000FF;
	Wed, 16 Sep 2026 13:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789565797;
	bh=xGpadioZ9a8WZQWlBNG7iy2ht/l/73ULAJbo071Ntok=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=b+JTn199Pl/adC0T7CbZk6k6Ck97H7F50CW8omw4B/I30T35CFlxwM1ajocdfwXML
	 P7AThr697c19/baYU4KIpSTIyTwWslnRV7pIhkMa/1ZeqbrOIRn0KmPdPrU8/HXMdT
	 G3n3oZVrbXPTr6cwuAmWGAFD6xnsvt2/NjexIlYpd/mlFAPnU0ltoMvTspKctfaUn3
	 WIEYN5tRQCFq41zLa4tuw6arO2MP7jObDGVfu9NBrN4sSIhGB3EII3mzSWltmGgrxJ
	 MFIyWI8hWIbPLSgzii9xdqEoxJzJWsnPy0QgRhDYGloTm4DCqYWQ4AD6IWnygwfzBO
	 bITYv3XzsNbRg==
Message-ID: <1ee4ce2d-ba61-40d8-8eae-e3462df15493@kernel.org>
Date: Wed, 16 Sep 2026 08:36:36 -0500
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
 <70a3162e-aca7-44b0-9896-423dd8071838@kernel.org>
 <20260916133518.GS106095@black.igk.intel.com>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260916133518.GS106095@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/16/26 08:35, Mika Westerberg wrote:
> On Wed, Sep 16, 2026 at 08:26:07AM -0500, Mario Limonciello wrote:
>> On 9/16/26 02:38, Mika Westerberg wrote:
>>> Hi,
>>>
>>> On Tue, Sep 15, 2026 at 03:42:43PM -0500, Mario Limonciello wrote:
>>>> On 9/15/26 07:49, Mika Westerberg wrote:
>>>>> Hi,
>>>>>
>>>>> On Tue, Sep 15, 2026 at 01:21:39PM +0200, Nils Arnold wrote:
>>>>>> Hello Sanath, Mario, Mika and Basavaraj,
>>>>>>
>>>>>> I would like to add test evidence from two Strix Halo hosts to this
>>>>>> USB4 reset discussion. My reset test used a backport of the ORIGINAL
>>>>>> f1de1fc5f632 commit, not the newer deferred-reset implementation.
>>>>>> I have not tested the revisions discussed on September 15.
>>>>>
>>>>> Okay the last message on the thread I asked if we should revert the commit
>>>>> for v7.3-rcX and then try to get the "better" fix into v7.4. At least what
>>>>> I understood it seems to solve the issue without the deadlock and killing
>>>>> the whole host interface underneath everybody else.
>>>>
>>>> FWIW to Nils I left a note on that thread and agree with Mika.
>>>>
>>>>>
>>>>> Once we have that patch, you can test and see if that helps in your case
>>>>> too. Now that we know AMD guys can CC you when they submit it.
>>>>
>>>> One thing I'd like to note though; I would rather that we keep out of tree
>>>> modules out of the conversation on the kernel mailing list when it comes to
>>>> upstream behavior.
>>>>
>>>> There are multiple ways to do xdomain tunnels in the kernel, and we should
>>>> collectively fixate our time and energy on bugs related to those instead of
>>>> PoC out of tree drivers.
>>>
>>> Fully agree. But the same behaviour is with the in-tree Thunderbolt
>>> networking and stream (and maybe DMA test) drivers so those should at least
>>> be working with the AMD controller without wedging.
>>
>> Yes and no.  That out of tree driver might be configured as a module, but at
>> least I haven't audited it.  It could be causing other problems too when it
>> accesses certain symbols.
> 
> Yes agree this but I mean if the issue happens with the in-tree drivers we
> should try to fix it the best way possible. And my understanding is that it
> happens in your own validation too, right? This is the same AMD controller
> wedge issue we are talking about where the fix was just reverted by you and
> now you (AMD) are working on better one? Or I'm missing something :)

Yep, totally!
