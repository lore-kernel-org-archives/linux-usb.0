Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792505966;
	b=BTJTNFY1LCZ/UZybepFi3iYsYJnZctuXf9onhEUnyRowV4uWWalXTLODQIevVsX3g/vB
	 oPqX6PbTLlj4bWfWpwoMUQvjLtC9zUo4K4TWvSrZ1HrniKNd1qBrS51nV/FCeTgpYLPmF
	 1MBKKEwtrfvNCaWBY9SrY2v1ff92m2YaXrc3pMjcamcwYcrlYRulNFfswpIlwckG2najK
	 8t6dabe/M6gelODvh/BSSYIw+HpPLr3W5NzuhttbMkbpnDznpwiR6gTdbaYJi+pQBWqd0
	 BXUVJ0WugAyLIxrFD0dX3PwZWXF2JHID7QQSBGkCi2E2scTL9BWb2C5QrXy93X9Zk9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792505966;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=YkoDoRI70vCTaQBZvsRQEGTtNXqyblBPUwYfPQEb34Q=;
	b=Wuk6CbhE4QcdOfb1cTaYOD3SPlcCtuEj2gPO2EkGOavqKgxQa90YcWjpwL7H3uAK6LUX
	 D3m1rKY1ahFcGRI+GJl5fU7p6skLH0iVygHfm1vrwuzoubjtOF3IHrA5mgOA9uHdbxnfe
	 R2AWGkYBahf88l5OhNKpNYnB1aC0xl0bUWuuhP//YQAgzi6zcvFa2y8XWrvOE2yuT8OXF
	 iY4pHf72EUlC7ib/PWeeqRVRT3ZImiiQ2CH24eqYTy5+wWQe9HE9KEW9xcq+FHybbcDdK
	 4r5IQ9CcfSgB1H3aZpnEld8hPmkiqosNyJwlI3uxMDLx0xYDPk++VtbUr+0mTG8dKlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=cUsGTRWI;
	arc=none smtp.remote-ip=209.85.219.54
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EC1606A326
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 14:19:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97EC1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=cUsGTRWI
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-917bab38b14so34875476d6.3
        for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 07:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1792505964; x=1793110764; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YkoDoRI70vCTaQBZvsRQEGTtNXqyblBPUwYfPQEb34Q=;
        b=cUsGTRWIH9EJciEn7zAs4VS09n4txlL/2Kc6Jd/Iz4sj3PYxp29ix1P5ZiRvNCVMzm
         KEYmfGeExCYSLcLz/W/doOdtM8pHYKUDZMFuYLf2REbMOFcjrIyVPzc8UFKqfAugbnZY
         mAV1tDtdYAHB05jBGiEUMDiXiRQvKM4ZAIpxQUR7tewRu+oSif/5EuecdYlG5gE9nAg5
         TVboywSCL/FpJx4B6pgqnSKjDqh+J6Wh521nfhs2nEBJaIMNQ4WcD9DnukoDm20+ci1T
         RMAtRuuasFz9LrG+vnXh/H4+/lZIxGknEJ+SfYNZ8JYevckkF3fIrnReGZ5zYy6YzbiO
         sigg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792505964; x=1793110764;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YkoDoRI70vCTaQBZvsRQEGTtNXqyblBPUwYfPQEb34Q=;
        b=IA2UrFStCW7K8ZonV985rGsILMjWsyg52HoIMX9Mae0UiNVnb1dqB5QxBCcl1ryStL
         MaSvxXCJOs5bZdmmOJd/7YuZj8mHtto1iv9hg+F0NfSttU2Ym5QaUjY4z7tphumJHVUo
         PIbmx0q8CQLvcV1B6OkJ6JL7izPSsDDAyrpFJ6+u+SOGKgw3xpxooNUblAvasQaN6a2j
         wKHPaVu/5+bCpX7+c4ixzDpvlzNkSaVqUSIP5EeH1R9StTJU0IVKB8sTG9Y+m3eE8wB+
         dLEhKISaH9OTEcSV+bAsobtYuK4LW+ca6UkbQtg1tgqduxmmNtH6Fc1gWVBnXoI6NBrz
         Azzw==
X-Forwarded-Encrypted: i=1; AKwUvBww9TgOEMB3vu/4hHFytJv6V/83cU0H8pO2gcdL3VyA9A9buUzGbKxcXUOOybYOsbONP7QmKYqo4Xg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJWtuBh6+wymRrXmpiG2LDnxU6LXGIgR29lKd2gVGu2qNS05lnV
	1KGgQBvLSpFhvFptVO303mjNN8dMPLkTZHUA0k+cHHwaluItBrGUzrvNORWhnJ0Z1w==
X-Gm-Gg: AYBFou1UX1HaKt8T4MZSgSRbSwNzir543710ilPRKEKh7cKFZ7ecclol0xI1Hwj+2n5
	FQL0ItERMIQU3FgFYI9Kcn1Wdgk9MAOBkrYubywA7q4zscwe2d5uogiWy2Uq344yf7IfRtIeNUd
	m3QHTdEMKHz1Pq8XTgOPHzb3DvaCPiLI6E1QQdjW0acrW4BPLUz/A15MY7ngJ4sMgAltrx8tOqn
	hQmFL7yBgiHHJfbJTsnK/ljm6Lf1CDcaOsuhMIn/PBtGiKv99NSWw1VQKeSWofurHaO/d/LQ52x
	oMmxKr6FZeyYvnyP2Eh9mKZIoRdQYXKCUW2Y0vvDRDgp9SQX52ltB8E3ThHHMZ26SOxna+Tbsnv
	j2CqOauX43buvxfeAtLfDoGbn8N1AmK28G9uQu/5Ak/9tI6Up4+BmqRhmtlLHCQGU/uSDz68fDS
	krdoucm8nTk0wOeheWjDhowE0obccw73fpuYzXmjJb8rMSDTdWa/MWsGH3RMPqlbSLSYxKzIHm
X-Received: by 2002:a05:620a:3711:b0:93f:22af:cce7 with SMTP id af79cd13be357-93f29b48f0bmr1804346785a.12.1792505964411;
        Tue, 20 Oct 2026 07:19:24 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::4791])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f4b10563fsm227100085a.43.2026.10.20.07.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:19:23 -0700 (PDT)
Date: Tue, 20 Oct 2026 10:19:21 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Joe Wang <joe_wang@aspeedtech.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: ehci: Quiesce ASPEED EHCI before halting it on
 shutdown
Message-ID: <8e2fb3af-3bf9-448a-a6b3-16f629417152@rowland.harvard.edu>
References: <20261016-upstream_ehci_aspeed_shutdown-v1-1-8440c13b5652@aspeedtech.com>
 <7dfc5ef1-a466-4d78-af65-147bee8fe698@rowland.harvard.edu>
 <OSQPR06MB725090D70BB07F70A2B521E789672@OSQPR06MB7250.apcprd06.prod.outlook.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSQPR06MB725090D70BB07F70A2B521E789672@OSQPR06MB7250.apcprd06.prod.outlook.com>

On Tue, Oct 20, 2026 at 10:42:55AM +0000, Joe Wang wrote:
> Hi Alan,
> 
> Thanks for the review.
> > 
> > Under what circumstances does ehci_shutdown() run without ehci_stop()
> > being called first?  Is controller death the only possibility? 
> 
> No, it's the normal case: ehci_shutdown() runs from the .shutdown
> callback during reboot, poweroff and kexec, where the HCD is not
> removed, so ehci_stop() is never called and the controller is usually
> still running with devices attached. The issue was seen on a host
> using LinuxBoot (NERF) firmware, which boots the final OS with kexec.

Okay, so this will slow down a normal reboot or poweroff.  Hopefully not 
by very much, if everything is working properly.

> Controller death is mentioned in the changelog only because relaxing
> the check in ehci_quiesce() also affects that path.
> 
> > If the controller is dead, will quiescing work?
> 
> It won't help, but it's harmless. The death path has already cleared
> CMD_RUN, CMD_ASE and CMD_PSE, so ehci_quiesce() writes those bits back
> as zero and the handshakes either succeed at once or time out after
> 16 uframes. ehci_shutdown() already touches the registers through
> ehci_halt() in that case anyway.
> 
> > Is there any real reason not to do this on all types of EHCI controller, not
> > just ASPEED?
> 
> No EHCI technical reason that I know of. I limited it to ASPEED because
> that's what the report and my testing cover. Since ehci_stop()
> already quiesces unconditionally, doing it for all controllers should
> be safe.

I think it makes sense for the change to apply to all EHCI types.  It's 
not really a good idea to leave an independent DMA master running while 
the system is shutting down.

> > Don't you want to check whether the controller has already been quiesced?
> 
> The quiesce has to come after rh_state is set to EHCI_RH_STOPPING;
> otherwise a URB submission or hrtimer event could re-enable the
> schedules through ehci_poll_ASS()/ehci_poll_PSS() before the halt.
> That's why v1 relaxes the check in ehci_quiesce(). The side effect is
> that a controller that was already suspended or halted gets quiesced
> again, which is harmless but unnecessary.
> 
> I see two ways to avoid the extra ehci_quiesce() :
> 
> (a) Keep the relaxed check, and in ehci_shutdown() record under
>    ehci->lock whether rh_state was EHCI_RH_RUNNING before setting
>    EHCI_RH_STOPPING, quiescing only in that case. This is the
>    smaller change.
> 
> (b) Same as (a), but leave ehci_quiesce() unchanged and have
>    ehci_shutdown() call a separate helper for the schedule
>    quiescing part. Other callers of ehci_quiesce() are then not
>    affected at all.
> 
> Either can be combined with dropping the `is_aspeed` check. Which would
> you prefer?

(a) is more reasonable.

Alan Stern
