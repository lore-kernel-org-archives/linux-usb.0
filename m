Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C934DBD61
	for <linux-usb@vger.kernel.org>; Tue, 15 Sep 2026 20:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789504971; cv=none; b=HBEP+322/KCvx34/Q3ErfB5e3wee80IpgMo/3O5UDXO/XTbyzDbywmiTI3o6weYokGgvjA0rMP3Fj5ZJC3cOLsY34y6tIMW6+8pFNlhl0tsfXvDDMLThR8O/h3hjdtJ9rDICH5NDEA1/z7EliF7c922iOBE6e/g2+sB4FC6fFJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789504971; c=relaxed/simple;
	bh=Ln38LgOgczlmNkJ0wPM0hRGSLl1tBZg6Te+h/lLt7vE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h2bboCfb0AaZ8WrvXLJcHn4PWyoxhV/PMGbhDYUe0oP98nECsEv7QECao7j6kd/rmfN4NSVakgQiSCMr0JOT1U7jRb0CryKkrv488fcbTHNvSWLhVL1da1lyARt/+OIwKM7YFNH8XKi5MZtB4nJ6ExiJU5k4UMpcdZaWSA6Aq3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NXJU2GD7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NXJU2GD7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D9111F000FF;
	Tue, 15 Sep 2026 20:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789504965;
	bh=1e8nCQCRowaxnhlknhuwl+E3ICRZ2Ndinc7DVdmb2/0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=NXJU2GD77rUGrAvJXITy6baz8//PpUHnNbV7gkK48C1rjyLllhX+p1Pt3+A3Wo9th
	 HfTfc4lHXZl1668AhxdgccPz7E6DFAojdpxRtCDW0DsgTBvBihGQvTv8hwc1TCw2Ac
	 N2yBC5Pc58aOf6whzeu6/BqlBIGNGm6fmmr/I/7wQygJPB5FtVr3iy5dO+ziDmejYu
	 Mo45qHwQ0YaULGaWGj5iGjPXupgF7Vjf3QB77lZlP/y99NtT4Kz4zisE+SjUf0cfzr
	 AC9XbLYQDrOUAU8m44a9JcLOnB53X+vr8Vfgv1KW1cM0Wn1brv08SEaq+fC/GwrHb6
	 shqJhvGZNJMfQ==
Message-ID: <853b62e8-5b07-43d2-be93-bfbd95f55165@kernel.org>
Date: Tue, 15 Sep 2026 15:42:43 -0500
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
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Nils Arnold <ns.arnold@web.de>
Cc: linux-usb@vger.kernel.org, Sanath.S@amd.com, Basavaraj.Natikar@amd.com,
 westeri@kernel.org
References: <a3437a3c-cf2a-4034-ae1f-0fb4bad0197b@web.de>
 <20260915124904.GK106095@black.igk.intel.com>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260915124904.GK106095@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/15/26 07:49, Mika Westerberg wrote:
> Hi,
> 
> On Tue, Sep 15, 2026 at 01:21:39PM +0200, Nils Arnold wrote:
>> Hello Sanath, Mario, Mika and Basavaraj,
>>
>> I would like to add test evidence from two Strix Halo hosts to this
>> USB4 reset discussion. My reset test used a backport of the ORIGINAL
>> f1de1fc5f632 commit, not the newer deferred-reset implementation.
>> I have not tested the revisions discussed on September 15.
> 
> Okay the last message on the thread I asked if we should revert the commit
> for v7.3-rcX and then try to get the "better" fix into v7.4. At least what
> I understood it seems to solve the issue without the deadlock and killing
> the whole host interface underneath everybody else.

FWIW to Nils I left a note on that thread and agree with Mika.

> 
> Once we have that patch, you can test and see if that helps in your case
> too. Now that we know AMD guys can CC you when they submit it.

One thing I'd like to note though; I would rather that we keep out of 
tree modules out of the conversation on the kernel mailing list when it 
comes to upstream behavior.

There are multiple ways to do xdomain tunnels in the kernel, and we 
should collectively fixate our time and energy on bugs related to those 
instead of PoC out of tree drivers.
