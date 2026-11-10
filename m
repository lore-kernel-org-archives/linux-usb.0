Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794350983;
	b=enBrirNrcmD19zh4TY//EtOzClZD33+lw5QDyHMR3sGt9S96vSXE0/Cx/yI3g5MbYZbM
	 x7LMCuFG4P4/Ot9veTE6YePv0YXurQeKpcOninfzwX6eVksU48HMaZEXN5UriprrFRZ9V
	 NXamBzHV4SK/agQUuVCuoY806h20WUYUwp8pzyII/p9H2IeLj8ZPLA8nYmtQU+YCIDCwC
	 VVPH1WLaBUtiBZS8PD8yJaK9gq1xoZwXWG0VQDY+CMZ37RVnlnA5FfznfAtBXB7rab2Tu
	 Iu+HfOn7KHMeaONhAcm0JRpU/64ZyttgcZ9SFL1hL6z6D6IWtl0spGejpCCtiYb2o8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794350983;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Zb5GE7voOWxwh8UbV4qumyj78WA5sPTQl21oSAR4TuY=;
	b=c7qo2FzXzBqyZKeYW1vLMXrl1s/aTwKkHWjeV0DV9rKjtrZXlVMJlSLwyydBrqloMJGs
	 zFd41LUYZd4ZBEh0fHv59CJXqkayDyCUn4QKu6Rikx1DzJHmsPNqLf7blvB19F5NrWH62
	 4RntEdBi/0UIZSu8witvyV88OyRyHIOLrRKPzptS+dbHBhGdbQCtRXqqaEhtG3/3hh4Dw
	 z33YUMng7y71R/gPdK+yBkC9Dsznr4RWloyUZhh1YZUnXKdo9URb3miYVxrJNEnBhJKR6
	 blR9xCZLHr2kRbNduSEyYN7GR+QyYgUgGAXhCJhoMkGf9FpE9z6o14/mctIxrJbsKiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=q6wsO1oT;
	arc=none smtp.remote-ip=209.85.222.177
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93F1606A31C
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 22:49:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D93F1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=q6wsO1oT
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-93f3c895a0eso220522485a.2
        for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 14:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794350982; x=1794955782; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zb5GE7voOWxwh8UbV4qumyj78WA5sPTQl21oSAR4TuY=;
        b=q6wsO1oTqdGikupBZB0pAkfYl8nLQNYg2IW1q2B4ZhBGHY6PT5ozHH3XZ5pkwQ1qXN
         QY8MLEglOGyRWF+Ab9VavTiAfZnnHryJ/VU5+k+ZxCPDX3ySe3JA8V3TU5razLymCST9
         BKWvX++hciMqb4NRiXYcrQssLabmACzVmlJlMwI3+5VW9iXTJFCQd0Qeac/tl7NhfOq8
         VxtDmwKx0CmCwUcqfiZ6W07fHrJpaHfW+9VvYucycnEfsdPGmBg4SmlUTu1ohw2OOTMt
         dvKKageeSbyuPekO3ReSnE6nYPorGpatcyjYf654TwUKchrGGL3QJ9FgcCXRIOjTKlKB
         oEEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794350982; x=1794955782;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zb5GE7voOWxwh8UbV4qumyj78WA5sPTQl21oSAR4TuY=;
        b=caFsD0hzY75CayMluBgwehHCIJuat30xsNzwlo5ZOv4Fm+CnrrC5KK5Q4bk2TWie3w
         FDxDmdGp11dViDR4SA7tiCsGeGbMWsj/k80vA2K/d8u7EKHrFTpUey1+zWMmuoTWYrLO
         5rl2lInScIhMMPxBD5xrel4QO1VWl90C1Sud29gnrD2j9Y155+eWe1NQy3772/6+n51p
         Ck1vJ/jhTUXaZ6a3mf3akapkNvXxfLUdMvWUJNe3nnDg3hYehj5CnZtiuVcyGipl+JoC
         b3AclK/RlTDCCWPKNT+orTT9X97fBj7Ife2v7iLigbKKKblxOyOUl0WsGRNBQMzseEZi
         Jtng==
X-Forwarded-Encrypted: i=1; AL+hErFMzWtEH9TRIXmFMO7VTgFVSZv299K4eNp4luFR8e3uYNSeCktUA37pf5O5P7sxueefn2uBuLqtjgY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zjOPWmDU64j4qyrAl07EfXZRqUcw1nxBLe80K3xg7XllQSkzV
	n9o22JNinlZzDOCfVKqCsB9gEoTe3Z5QP4QwfXGnDDazsufI3g8vaWIX5tQAD2VHX1oMQrg12+8
	KrL7Gmg==
X-Gm-Gg: AYBFou0kqFhaqxWxIoym8tzwfjT82w3EZejNO6zYxmkA4z8L8f5/6OcwQ1rdwcCU2HG
	bn0SP2yCYJY5tHDVxf54w+3B4HTDl0jEj35zcKexH6OK7AzUstGh8odFgH4a4cNtFTkBdgbXtUa
	0P1l/fiEkRRb47IYY5G3EnOh7okDzeRp+ko+zAABnalwxZEKgyE+sI4f71cX0SUb7BbpNiDgeBu
	osTMhAFwGb5HsK/WmoJdrUaOxehlpi8rdhSaEGXCkTdKxdL3wppGBoO1Sx3AVF1gi8FllwADtR7
	5dcoE0jZF0ivKRijJ4pRUr39khHMQ/fwuBdoiTVXqQPUbD73bfJO2U13ScH166fDarOEqxSeUrw
	5mH/bOQ6Mih3CPKofUegSfuoc9SBUXFh7+2OFHqcgoUZ1ntkMfpfpF/nbkGkySHGMb9JZZyHkmL
	3mHFsq61YWHEOHQjnnijgDza61I0XYZntN+Suzpz4bngVm+lbBF7t4p/BrBVF9YmUULQWeRJNYx
	cAzj9b0TOopqA8xsyMcsun3QAcBuxu5loKEnAOCHWmCeKc/Awi/x+15snCwj1ADC6cOFNgN6Bv4
	Y+czM9tKRLgapKaOGBEdFv28E7DSEQVUuTmo156l9jNclpSSblU=
X-Received: by 2002:a05:620a:3710:b0:93e:e531:b78d with SMTP id af79cd13be357-947afcd2ef5mr91279985a.7.1794350981531;
        Tue, 10 Nov 2026 14:49:41 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::d355])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e7e3c34sm335467185a.36.2026.11.10.14.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 14:49:41 -0800 (PST)
Date: Tue, 10 Nov 2026 17:49:38 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: kayano050408@gmail.com
Cc: Neill Kapron <nkapron@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzbot+c73e1942197af9f54ca3@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v8 0/4] usb: gadget: gadgetfs: fix ep0 request lifetime
 and event counter
Message-ID: <a63177cc-ab89-411a-a6f0-a8a71925aa43@rowland.harvard.edu>
References: <20261110-gadgetfs-ep0-v8-v8-0-8f90434574fe@gmail.com>
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
In-Reply-To: <20261110-gadgetfs-ep0-v8-v8-0-8f90434574fe@gmail.com>

On Tue, Nov 10, 2026 at 12:13:21PM +0800, Jing Lin via B4 Relay wrote:
> This series fixes the ep0 request lifetime and shared request buffer
> races in gadgetfs, and the pre-existing event counter underflow.
> 
> The first patch covers request lifetime and buffer ownership, the second
> the ep0 setup abort and unbind state races, the third the event counter
> underflow, and the fourth removes the const cast in gadgetfs_setup().
> 
> The setup() callback runs in interrupt context and may not sleep, so a
> mutex cannot be used to serialize it against ep0_read() and ep0_write().
> The shared request state remains protected by dev->lock and the control
> payloads are handed off through private buffers.
> 
> The series was tested with the syzbot reproducer and with targeted
> lifecycle, request-reuse, abort, unbind, stale-setup, and event-counter
> tests on arm64 QEMU with dummy_hcd, KASAN, and lockdep.  The syzbot
> reproducer still exits 137 on the fixed kernel without a BUG, WARNING,
> KASAN report, or lockdep splat.
> 
> Signed-off-by: Jing Lin <kayano050408@gmail.com>
> ---

I'm going to need some time to refresh my memory on how all this stuff 
works in the current driver before I can review these patches properly.  
And since I'm going to be very busy during the next few days with other 
matters, it will be a while before I can reply.

But first, one thought about coordinating setup packets and their 
replies.  It seems that there's an unavoidable race between a gadget 
driver queuing a request in response to an old setup packet and the UDC 
driver invoking the gadget driver's ->setup() callback for a newly 
arrived setup packet:

	UDC driver		Gadget driver
	----------		-------------
	Setup packet arrives
	  Call ->setup()
				->setup() returns DELAYED_STATUS
				Prepare proper reply to IN request
				  or carry out actions needed for
				  OUT request
	New setup packet arrives
	  Call ->setup		Call usb_ep_queue() with reply to
				  or status for first setup

At this point there's no way for the UDC driver to know whether the 
request it was just asked to queue is a response to the old setup packet 
or the new one.  This is a real flaw in the gadget API.

I've often thought that UDC drivers should assign a sequential ID number 
to each setup packet and pass this number to the ->setup() callback, and 
gadget drivers should include the number in their response so that the 
UDC driver can tell whether the response is obsolete.  Too late to 
change the API now, unfortunately.

Alan Stern
