Received: from mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3555037C926
	for <linux-usb@vger.kernel.org>; Tue,  6 Oct 2026 06:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791266736; cv=none; b=V4alK7Rh/Hl0AD5vEmbzAwQ22Oap30w0zNeXbn4Ky1WJwC/h4e1CZ9yR8Cdn9RJq2vxuKvPhmSOt9ciNJx/2cBN7/HKNM/Xe49Mu/lPLfI1dOCSFUW+8yWlyGClvAtv2t3WyPohIIxZJ5RWRiIzL2BN+atK9u4RKw79XISMXxi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791266736; c=relaxed/simple;
	bh=Tf9n1BloBcI91rWb/ZMEgBWuz9XdkxZ/PL7BE8R7o7M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=sLDMjEzTmK/lUwuDf+tNML4Z97OMYOcdIVf1dfMlgCwfr2dxDmoDtS+tTf7GmxDBJlZRqiinLKwRtCNtyqxEsBCA/hW8Ey8/uzaViCKDIAhwTwLMN2FrD5GvuQfiWMIWi0qkAMUvucwyR6Y5kiFUhfElgKQN8wuuI4Bb9US/O7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=NOPttqRH; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="NOPttqRH"
X-Envelope-To: linux-usb@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Tf9n1BloBcI91rWb/ZMEgBWuz9XdkxZ/PL7BE8R7o7M=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791266731; v=1; x=1791871531;
 b=NOPttqRHKVvT7BwenJp+F6IpDLbAuE/RPhqLXtQiA6GKftRVf/JQQS4ol/TaL1UUD9DEr3HA
 t+3Pk7z7m5bujluLeKER8ebIoP0dnGJyUHchloTKp9wRfNDOdURK5ML80kccHyh4CrodcS3N7lp
 zVdTijbBvY20ipTHbmdsGFe8=
X-Envelope-To: linux-usb@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id d24b8439af00a1e1;
	Tue, 06 Oct 2026 06:05:19 +0000
X-Mizu-Trace-ID: d24b8439af00a1e1
X-Migadu-Flow: FLOW_OUT
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,  "linux-usb@vger.kernel.org"
 <linux-usb@vger.kernel.org>
Subject: Re: Thoughts on Sashiko reviews for linux-usb
In-Reply-To: <2026100622-kindred-alphabet-7802@gregkh> (Greg Kroah-Hartman's
	message of "Tue, 6 Oct 2026 08:01:34 +0200")
References: <asRCTFE6gFlHBIu6@vbox> <2026100647-stilt-mongrel-b368@gregkh>
	<2026100602-overtly-scaling-3153@gregkh>
	<7ia4ld8b8jhj.fsf@castle.c.googlers.com>
	<2026100622-kindred-alphabet-7802@gregkh>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Tue, 06 Oct 2026 06:05:17 +0000
Message-ID: <7ia4v77f749u.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:

> On Tue, Oct 06, 2026 at 05:51:20AM +0000, Roman Gushchin wrote:
>> Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:
>> 
>> > On Tue, Oct 06, 2026 at 07:03:14AM +0200, Greg Kroah-Hartman wrote:
>> >> On Tue, Oct 06, 2026 at 12:45:15AM +0000, Thinh Nguyen wrote:
>> >> > Hi all,
>> >> > 
>> >> > I'd like to get your thoughts on having Sashiko send review results to
>> >> > linux-usb for patches posted to the list.
>> >> > 
>> >> > I started looking into this after receiving a reference to a Sashiko
>> >> > review for a dwc3 patch that I wasn't Cc'd on, which required me to
>> >> > track down the review separately to understand the feedback.
>> >> > 
>> >> > Sashiko is currently configured per mailing list, so any change would
>> >> > apply to all patches sent to linux-usb rather than a specific subsystem.
>> >> > 
>> >> > Would anyone object to enabling Sashiko reviews on linux-usb?
>> >> 
>> >> Not at all, want to submit the pull request to the repo to add it, or do
>> >> you need/want me to?
>> >
>> > Now done:
>> > 	https://github.com/sashiko-dev/sashiko/pull/651
>> > but I don't know if that adds a "will email back the review" workflow
>> > for patches sent to linux-usb@vger.
>> >
>> > Roman, it looks like the sashiko.dev/email_policy.toml file isn't in the
>> > repo anymore, or at least it's not in the git checkout that I can see.
>> > Does the linux-usb list need to be configured anywhere else as well?
>> 
>> I moved it to deployment/sashiko.dev/email_policy.toml while preparing
>> to support other projects.
>> 
>> You need to define the email policy to receive reviews over the email.
>> I can help with that, just let me know who it should to/cc?
>> It seems that the most popular option is to reply to the author and cc
>> the mailing list.
>
> Ah, issed that file, sorry about that.  I've submitted:
> 	https://github.com/sashiko-dev/sashiko/pull/652
> to add the default policy (to match what we have on linux-serial as that
> seems the most sane for now.)

Awesome, thanks! Applied.

I'll roll out sashiko later today; it won't be effective until that.

Thanks
