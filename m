Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850993A63E6
	for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 15:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771948373; cv=none; b=iZ99QxWk9pQ7ZRT683VCIq+eqq/H9r3Nun8Rv52zYMghTas/Q80nCdRgL4qctvK2KmuhV6tOjVF5RQDGccfOf8KWJNvEFh0+3DsxSh8xkZoz98umKQ/URhCzIsv7nT36aJjfaCQOmjA3FFgxpdNb/qDn0W8/AIDBdkDO0kbgBi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771948373; c=relaxed/simple;
	bh=u3ZC1ONQefl+BQx810dmBU2wgr3NRcAVXhGJC4qtj94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BbkVW2tAo1NAQVqBABq3Eu30+uwzNc5buskAI6cxLDhPR/Ui97j3hFnsTymCM9CT2r6Y7lM3Mo+8Sj2HQMvAABCl8atLkvldhIXMzxjSdsWd9+TV6mUjvzH3xU2o0wmoHR5/u9zjPiQK+p1s/BB+eJ39TVgRa1SeS/LxHqxVGok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=YKAEyEq9; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="YKAEyEq9"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-506a297c14bso48343821cf.2
        for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 07:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1771948371; x=1772553171; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5/WA/634FWzZhP6hLaYcCYjzgcQV2VnfoJ7OmSDJApQ=;
        b=YKAEyEq9Y38D/Ub6dsAXBLBuc+vciJkB40efHo61w+bd1QCcK8tZtB+11mySZtY3lh
         uQ3ZkJOLtyjiKlO5Gs8OxWNzJcXhZ+oqUE/09t+S4DQ5mHGC8EjVhUDBMg+rtPlODtzl
         7fhxuPExqHe5ExJFjQIs9I0Pz99eS+VSJMMUeHCC9vX1YxyOTafVZK5K8DaS/js0Pm2D
         Wp67qQSDUs1K/NET2R5XZg+3E1Xm9qjt+C0eB2ACZrXfHZJmjdYGfpSUCR/ts6FW2sSX
         NsKbgHe3/SupXrOXxtAH+fjHdAdZIY0/jP2U9YYbdWHAQaNGa3Tzln4UcwHRnhTxZpUk
         sRTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771948371; x=1772553171;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5/WA/634FWzZhP6hLaYcCYjzgcQV2VnfoJ7OmSDJApQ=;
        b=qxpKOK+mHJyRyf1gAbJzqA5PvdsXomd4dn/xPL62gX1QXmrI8EjdVabuCsaQbvvAeP
         rPBtUIo/hFf1fyt3kkmVwNvkOdgHI89eQQHHavusB6/8yJT2HwI4N5BtKUwOHypFBTEf
         Ut/dQpjPrzQ092lGzlE2EWOZjB2TubGCqwIPaIgTBT/my71/TavEQvDTiCQgSlNSivjT
         D9poTZhpgLNKVqV4Mg1RUGlua1ky92BylN85XdwPdx5wCf9OU4D4RgDS/JpNMTrSgbCS
         bXF1uW0agWZuraOcOFtZkpqi1syb2/y4VJdYeHRgIGJ++w70/eIuUX7UpwI/Tuc5XfIo
         ZU2A==
X-Forwarded-Encrypted: i=1; AJvYcCVe5LiycnPf7scHRl7vikBqa23TY59yXjQeVmCyRfgqFDrkp2JceB/zfEXsdRxVzWtigZlmBXgou6w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWSWeqe7zvgMzZlhLMFP9p7a330TF87wbkVSqYcaT9EMT39mLx
	C8BCeI8fQ0nEea0af0+N8uR2UETYgnOG30VR3yOpowkHe0rY07HZhmfJskMIprhdGg==
X-Gm-Gg: AZuq6aJ20L+Xs5wrh9z17h+mR1kpCib+dC8aLZbKymmpdPNKR5j1DnzggjcHnIBTj0p
	cX5mZ6OtKWN+2h3w9k+NUuKlelD+N9gzGUqzTWQmxy2qGFwVMwMqOxwzwl+xL6vzJQX/AcT9qaL
	HEtZYiZ1R4K8i3dSm928Q+QysapAq/iVt0qlGGtkUAhtRIK54OK7b0eeRVX3Y8zpZCeMI+KaTxD
	RE9XbDHbAMKdmTnRumeVSfpkDomBQQi8UXX3N6LVXxrAWyltfExcGSQAQ6mD7GLSFvZlvAJCZKq
	x8JU4CBNiUlbfNCBZE87PZpisFFiyTmlrpgFdn8ad3fzzonhuGTcAiI2jKFCQpiq5zwzBY/EONu
	ubvrlwol3ume5MfjQLn8q/u6BVoFyhKNXEoFGbgqF3LJsRe7sfhNFBYqL+6p4R9u4/QnZeNkXRq
	/iV0mtHiOO12R1TZRbXqwC2/UY
X-Received: by 2002:ac8:5f47:0:b0:4ff:a46b:3af3 with SMTP id d75a77b69052e-5070bbde6c9mr170087241cf.16.1771948371443;
        Tue, 24 Feb 2026 07:52:51 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::687c])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5070d6a2676sm95215211cf.18.2026.02.24.07.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 07:52:50 -0800 (PST)
Date: Tue, 24 Feb 2026 10:52:48 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	Nicholas Carlini <npc@anthropic.com>, linux-usb@vger.kernel.org
Subject: Re: Stack buffer overflow (write) in kvaser_usb_leaf_wait_cmd via
 malicious USB
Message-ID: <eb96e0e4-b02a-48e5-ae07-bc31584f0855@rowland.harvard.edu>
References: <CAOt5ifARcQqqGc65hHXR2JNTDg0hT0cF55Kb-6USEsqjEPM1nA@mail.gmail.com>
 <2026021847-acclaim-coil-fe7a@gregkh>
 <a38ccefc-6233-4be4-bbae-0ae0d4f4499b@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a38ccefc-6233-4be4-bbae-0ae0d4f4499b@suse.com>

On Tue, Feb 24, 2026 at 09:44:35AM +0100, Oliver Neukum wrote:
> 
> 
> On 18.02.26 06:12, Greg KH wrote:
> 
> > And is this the only place in this driver where it treats data in an
> > untrusted way?  As you know, once a driver is bound to a device, we
> > trust the hardware to work properly, so this really is just a "let's be
> > careful" type of fix, not any real bug to be handled as a real device
> > will not trigger this.
> 
> Do we know this? I am afraid we need to make up our minds.
> We are including patches that verify endpoints are present,
> are of the correct type and so on.
> 
> What is the logic behind that? If we can trust that a device
> is what it claims to be and operates like it is supposed to
> be, why do we verify?

Greg said that we trust the hardware once a driver is bound to the 
device.  However, the endpoint-verification tests occur before the 
binding is complete.  At this point we do not yet fully trust the 
hardware.

While it's always possible that some real device somewhere will fail 
these tests, a much more likely reason for a failure is because the 
driver is being fuzzed.  We do know that these fuzzing tests occur in 
real life and that they will crash the kernel being tested if the tests 
aren't present.

Alan Stern
