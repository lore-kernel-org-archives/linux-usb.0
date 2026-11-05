Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793865166;
	b=zk3SWJiZGTMhuajSod935JSMUZ0yr/WyhRddnzUh3ObvizKUc41isnatosQ0c28+rxIQ
	 183BcJuXbSEgNi8CV8yNcmhCtNf0yZvZsXdbwVZCBijZBc3szOn8TqQ+99dpaQ9c3Baot
	 CNHoo2yO9v1d+Nbu/FxrP/WMAV0R40VcBZsMTfvTq5p5IeQCqxMJt35VXFQjcJqg3KbHL
	 Uu/co4QLzGdTz3In14j+9kHkh0smV9ru71HYuLnOfRcrAqlJHYWY3uNu6eIO93naRSiGT
	 qb31Ygz2sM0gWALpCHZwShFAvTXlJlvisAZK/xQAoHBY9G5KxBMXyZvWEPShOk8u1yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793865166;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=unsN6AHVNkCocRJQkDsmHPRKXeUWrdzS8/flo7s7TFM=;
	b=5KF8MPvceq6sZXolPtGpM1o///W9RRpGva3qEcIOV3Nh+AD03hSUUFSfZEurhKwaGBz6
	 Ij8R5BGT8diLZyFmiNcajRuz9M7x09aoet5FOY6g2DPTacgZGliEadTDqKDUMqBwDI9kd
	 nrFIob+dOgLjjGVy4ThXzwQjdtwlKtXnxW/WmYBAJGs348StqHlWv93uhwILso387mZ8n
	 cGE1t+L9RPyUgxCBQ6BWEA9DzybC8yQipUO682rBWvBeTXG/c7huEmBcyDdEH/wD1LAwd
	 q2AgJvRXqb+8cj4pWN/tQnN6mQl8zNj9eBs9ntm2qSM7xFZjGg/DOgBt9D0zDl5jDnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gTYTL5WW;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E41606A326
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 07:52:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2E41606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gTYTL5WW
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48dee593f18so1185470f8f.3
        for <linux-usb@vger.kernel.org>; Wed, 04 Nov 2026 23:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793865164; x=1794469964; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=unsN6AHVNkCocRJQkDsmHPRKXeUWrdzS8/flo7s7TFM=;
        b=gTYTL5WWYDxqb80o00A+Io7d6oUAzHxd1+A00C6XY8mnit39plO17qP/RrflebpSln
         xJoeT+4Zt/3aYy4vtNl0ptOE+QqUmgvSWjpIO/9+HLryekbeBoIMr0/2xO3hJ7bTmBUp
         CdwapW/909bXq2FYfecX0cA8VHiF8ftUMcevWmqTYhBeMbUF7dbTzLYSPWCiZDKsnnst
         BNNSkIP7AD60RWz5gX9wpnXEdyWMvauoP+tmX7t77tC7DXFtTKv1SAaIiGAtfOI57vlp
         zTU9AiTm/MYGeAzGX08iXfeeU3IMqnUjiqZut/T70pnzggmVlDyS9xAdwAISeNMlfoEd
         22fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793865164; x=1794469964;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=unsN6AHVNkCocRJQkDsmHPRKXeUWrdzS8/flo7s7TFM=;
        b=IJXXxmJMBTFs0Ox3a5DWrBbo5wE5yj6G9uIWw5f9q7S9C3h+VmYxbQILBoNOMAU8OE
         dLCBtrbi4+7yVgQkZN9QyyCJgf8LvUDxcd39plmDYplbz9KfQTCFLMLJjM87Kinb67jJ
         aANCnaOaVZvlnNS2CnZHJ0a1cQ/A8LGgRMBl498GWCHNEpIboNFzI4KnhquJcKlwQvkk
         IhRax4Q4iDOCLQwMyiLqxaHYr5O/YsZ0nVIn5c9pP1q2ITzzZKvgDWe6Prm81r+E6tM3
         hUQM6tel/3MUYBLi0/HT/iY8rfhZvBLA3tx5G53H3KgMZ32IVzFD9PwVBtjAn0+CtQrO
         bouA==
X-Forwarded-Encrypted: i=1; AKwUvBy+3IkaBjzmhvi2FWWfpIhd8AwnCyHLwizGwGAQF0Sa3Hb66q1+5cV66pMdu/KRAhK2WgRtCmrZG40=@vger.kernel.org
X-Gm-Message-State: APuU4Z94Mnp20UIG3iGnR2/1TYN70BjsUk/9lqxjBEqramHsJAHJTwC7
	9EB47t0Sa1TXxQq7/1xb+IfkR7CqK6tk9joDN0mrqmKDlOl/JAowIN7v
X-Gm-Gg: AYBFou35XIBZ4xLgxXvB9ttcAWIcuoqtjY2vlwVwhlbHCwyC+DkhAHt2HdjazBVWiiN
	LGOfjaTm/VCLu2eGkiSSbtVgsRn4K18fDPFzb0Txts/iJ0B3nbbVmbjL+QtHFgpq9NMj5tAOHtV
	3Bg8teHcScg/2usm3qiD+VEAARgll4JNA6rmM5KcRnZn659c3iM7l5+K24CHddkK9JeUYGwTwmS
	Eoin46yKxLa5ZMrQcwFuU7Uta8UUQ2/Tfe1XgR7S8MqL+Kf1/j2C+mZHiW7k4YvmdyZu8nF1a4u
	tHghDFSfTWnv4eIrLdgKATxfd+si0oXIfmPf6MrGs6eVKjk4hB/kW//p/27bLaDFUtePbh3if1C
	pb+pNkCkROKmbH8E0YuYTW6/zdSUC+tZGP+sqBsJ9px4B6JPmSmlYY58PRMv2bQvFjE3ufz/EWO
	A4ibUSu5iO4KT4PxnlzcFyABwfxAEfw9KN2vGcj1Se5c0s5YviMU12ah2pZDcOjWC6sLzvMXqqr
	fWLljwus/0aQOac7MHgh+AHxMp7Mllutvc4L8Ezj+r0sbKZIJYebvgl+plqUh1q3SyAjFiEgBIS
	OnN+Mj9fmyXtta6hD3YnfTMCqVdkLVn03osqqEP6J8PkO6tOncgh6fWY/3ZS
X-Received: by 2002:a05:6000:188b:b0:48e:3df8:74cb with SMTP id ffacd0b85a97d-48e6e2ba5dfmr41503809f8f.6.1793865164140;
        Wed, 04 Nov 2026 23:52:44 -0800 (PST)
Received: from foxbook (bfg124.neoplus.adsl.tpnet.pl. [83.28.44.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda20567sm8958338f8f.51.2026.11.04.23.52.43
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 04 Nov 2026 23:52:43 -0800 (PST)
Date: Thu, 5 Nov 2026 08:52:38 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: YuanZhe Liu <25031212351@stu.xidian.edu.cn>, Mathias Nyman
 <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Bin Yu <byu@xidian.edu.cn>, Cheng Wen
 <wencheng@xidian.edu.cn>
Subject: Re: [PATCH v5] usb: xhci: Fix use-after-free race in
 xhci_stop_device()
Message-ID: <20261105085238.337cb70c.michal.pecio@gmail.com>
In-Reply-To: <d7448504-a63e-4f3a-a828-7656b1084105@rowland.harvard.edu>
References: <20261104000031.679944e7.michal.pecio@gmail.com>
	<20261104035637.3325-1-25031212351@stu.xidian.edu.cn>
	<b8ea2f8f-ff9e-4cc6-853b-114fe51173e6@rowland.harvard.edu>
	<20261104175949.71804650.michal.pecio@gmail.com>
	<d7448504-a63e-4f3a-a828-7656b1084105@rowland.harvard.edu>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 4 Nov 2026 23:54:39 -0500, Alan Stern wrote:
> > What I find more disturbing is the existing protection from this
> > race added by 88716a93766b - it looks like core was triggering this
> > too.  
> 
> I don't know anything about it.  That commit only touches xhci-hub.c, 
> not usbcore.

Well, it looked like core was calling hcd->bus_suspend() before
disconnection has completed.

But I just found that xhci-hcd had a bug where hcd->free_dev() would
return before disconnection has fully completed, which can obviously
trick core into doing the above. Now fixed by 7faac1953ed1.

> There should never be any outstanding URBs on suspended ports.  If
> you have any examples, they need to be fixed.

There was a report of some HID driver leaving a pending URB on ep0.
Core blocks and flushes other endpoints, but ep0 is still needed by
device driver's suspend() call IIRC, so it only gets flushed after
the port is put in suspend. I wrote a patch which reliably triggers
ep0 unlink on a suspended port in this manner.

Reporter's HC wasn't expecting this and failed to perform the unlink.

> The core relies on drivers to unlink outstanding URBs and not submit
> any new ones after they have been told that their devices are going
> into suspend.

That's a little weak. The reporter got an LLM to patch the offending
driver, the LLM claimed that other similar drivers have similar bugs,
business as usual. IDK if they have been fixed.

Also, core ignores suspend() routines returning errors during system
sleep transitions. I'm not sure if drivers are *allowed* to return
-EBUSY in those cases, like they do to prevent autosuspend, but it's
at least another opportunity for bugs in drivers to cause issues.

> I suppose we could check that there are no errant URBs still in
> progress just before putting the port into suspend, but is this
> really necessary?

It's already being done, looks like those drivers aren't *actually*
trusted very much. But there is the ep0 loophole.

Regards,
Michal
