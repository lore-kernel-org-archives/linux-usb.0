Received: from mta1.migadu.com (out-219.mta1.migadu.com [95.215.58.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037BF3783B5
	for <linux-usb@vger.kernel.org>; Tue,  6 Oct 2026 05:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791265891; cv=none; b=SrQhvUIU+5JF7EeDKNygKq0DrKTS0cZ0qxcj899VpaVl1paheOCUjCKg3EnB2QViLc7cJolAnJLKx4/M62dfjVvifV+mcRAua+igJh2WKVloOytDOnx2UdT+LMsC0Uimt9VXiPdSuSWHr8nuNFfsD1IdirJ3polDbQ2X6qqPRc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791265891; c=relaxed/simple;
	bh=Ym4izoUGFIL+ZvzKAX6yLo46MhRsrSCoFlnhkC08nNs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=u+yul+AfEC3+hzZ57WDaV4WyTSodOTitfAwJ5XCcdyvNuFvUK154boimpSnovUvRi8RKISVFW38cWGHhiF0N4Mk7OlKzuerukaUnBTKZ86HzgORGpT5sQaztXmAea05uX1d4o0JyvAzmKPPxPUXtYbhvaU7Kz3Gj/xgrnTzGu7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=C8eT3ij7; arc=none smtp.client-ip=95.215.58.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="C8eT3ij7"
X-Envelope-To: linux-usb@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Ym4izoUGFIL+ZvzKAX6yLo46MhRsrSCoFlnhkC08nNs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791265886; v=1; x=1791870686;
 b=C8eT3ij7MOTlKdd4dDE2G/ZaS7qvLcv3Z99dK2dzEZL1JjXq/TWzDyyIm17Z/6Wttcngo6O6
 X3GJ8vb2VWMnaC4+9Yfefla2hLN8Mr4GfhIzBoPYOWaOtgQi27mMIQ054dXJLOuy5lZEIJibebE
 jFJ3iPjO88q8smVERFkdvuLI=
X-Envelope-To: linux-usb@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 08c460de624aad1d;
	Tue, 06 Oct 2026 05:51:26 +0000
X-Mizu-Trace-ID: 08c460de624aad1d
X-Migadu-Flow: FLOW_OUT
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,  "linux-usb@vger.kernel.org"
 <linux-usb@vger.kernel.org>
Subject: Re: Thoughts on Sashiko reviews for linux-usb
In-Reply-To: <2026100602-overtly-scaling-3153@gregkh> (Greg Kroah-Hartman's
	message of "Tue, 6 Oct 2026 07:41:43 +0200")
References: <asRCTFE6gFlHBIu6@vbox> <2026100647-stilt-mongrel-b368@gregkh>
	<2026100602-overtly-scaling-3153@gregkh>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Tue, 06 Oct 2026 05:51:20 +0000
Message-ID: <7ia4ld8b8jhj.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:

> On Tue, Oct 06, 2026 at 07:03:14AM +0200, Greg Kroah-Hartman wrote:
>> On Tue, Oct 06, 2026 at 12:45:15AM +0000, Thinh Nguyen wrote:
>> > Hi all,
>> > 
>> > I'd like to get your thoughts on having Sashiko send review results to
>> > linux-usb for patches posted to the list.
>> > 
>> > I started looking into this after receiving a reference to a Sashiko
>> > review for a dwc3 patch that I wasn't Cc'd on, which required me to
>> > track down the review separately to understand the feedback.
>> > 
>> > Sashiko is currently configured per mailing list, so any change would
>> > apply to all patches sent to linux-usb rather than a specific subsystem.
>> > 
>> > Would anyone object to enabling Sashiko reviews on linux-usb?
>> 
>> Not at all, want to submit the pull request to the repo to add it, or do
>> you need/want me to?
>
> Now done:
> 	https://github.com/sashiko-dev/sashiko/pull/651
> but I don't know if that adds a "will email back the review" workflow
> for patches sent to linux-usb@vger.
>
> Roman, it looks like the sashiko.dev/email_policy.toml file isn't in the
> repo anymore, or at least it's not in the git checkout that I can see.
> Does the linux-usb list need to be configured anywhere else as well?

I moved it to deployment/sashiko.dev/email_policy.toml while preparing
to support other projects.

You need to define the email policy to receive reviews over the email.
I can help with that, just let me know who it should to/cc?
It seems that the most popular option is to reply to the author and cc
the mailing list.

Your PR is merged, thanks!
