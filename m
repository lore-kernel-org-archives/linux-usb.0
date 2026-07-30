Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B902944AB66
	for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 18:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785435247; cv=none; b=lAUNAZcma1EpsCTIwex53/P3VOLZb6fJTApfWva6mbxA6Th1Rs0qciyKrRTTKXjJsRVj0jvNwx2nsGGW+vL5wSbkHiaF7v9OcodatwXALMtet4aTy+nff1LI8a/TbCXsezrq0LJaWiZ0IVNh1wS1gGJWk2YuwsGqk1LvymklXcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785435247; c=relaxed/simple;
	bh=Mp5aQD943zU/JlDu8wLKQ17Q/AzN5HkqiiQaDiU9EaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hmxJ7STjX1TlGw39FNniR2JrmzXwbR+i1nDdS3iQBpJuzPZDfKL4/LTd5rEM/rYBsAUdq7S+LzxZIOnBUBMzx0+UL5hh2JgQ6dZWXmua+zhtVvdCanaU9eQdncWMlZx0RNzj/YVMkTqAZMElVjTMldL6kWfp5lKqfoJt/a/Y6Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tremby.net; spf=pass smtp.mailfrom=tremby.net; dkim=pass (2048-bit key) header.d=tremby-net.20251104.gappssmtp.com header.i=@tremby-net.20251104.gappssmtp.com header.b=dGOeuIwJ; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tremby.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tremby.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tremby-net.20251104.gappssmtp.com header.i=@tremby-net.20251104.gappssmtp.com header.b="dGOeuIwJ"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cb5b8572b70so76256a12.2
        for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 11:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tremby-net.20251104.gappssmtp.com; s=20251104; t=1785435242; x=1786040042; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xeDMHiliNxzupNDBLPrTre6Kp5KkOMb7sy461A8moWA=;
        b=dGOeuIwJ/x1i+5A3KMlaKHoMQZ+N3lg3Q1dAJ2DSQnn8Aggw2M3u4eF/Yrh2sHrMWC
         uwPwX1CNNWMc9DlRH21CCrVgM/xDE6010G193L72MkTxrTaMrplRBAGf9BR6F+chQjUN
         NRl+IM2bt0ADWmIuKg+4gk32ssVZlQopHnq1nNpEJJ0sBPfMNMfIJIkZVilmqCrKxOrE
         p+6TBC2mc6fhHj3jT8GXRi0bwamdYEAFF19E8Sge5q4zSffJBuXyBWwF3Wc5zo9z2YXY
         8w7faTWSDLSczBRuol6APPdvfvOLadYwNx5PkgX7aLSrRs9FImTZeydNg5sAG5syQGn3
         S18A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785435242; x=1786040042;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xeDMHiliNxzupNDBLPrTre6Kp5KkOMb7sy461A8moWA=;
        b=mkXjsTCCgRM2yWQTvBQe0qkYCaWpuWl5yiQWq+CQTUj8hIrx9AA0/sgWIBxWujRLdh
         Uj2ECa1KM2xUmW/c0LdM1iGQzoCwtI9zwG1evoa6TverNLRdhlMbUPpYm+Iv/fDgDvF7
         suQ4h4e4OKwUmye52FmKh9xO5e6Fc8ufmCwP6Ktriz0Ai2dibhmosORtDlTNndZKbHPw
         c0h7Vmtyt15k+qkCW2WMmB1iqtIaJpCpx/FwU45+hIL57b1a+FBKM946LBuz6mIyDvWc
         9Ggf2fZWPxlBkitWmxYXUlCe9t3KMGwphC4zXh1GZFkQSA8RUG8ooYBgr9hG2Oipu73p
         Lqdg==
X-Gm-Message-State: AOJu0Yzbguha2Z1yIxDyzryhrHaMhzeypLyuHf5NN1MTapS0PJWw/hFq
	q+YeckGqeIEjKWX2KWCUiYVFOz1HhGAGNPuTz0E29kfSgAKp4z58ZDawZBCqgWhagq4dUkdY6vB
	33f7dI+17yg==
X-Gm-Gg: AR+sD13qNd2G3l1/sruf1UgbE5jWuPI2ACz0lsuj8EWCrc5yY55vOK56wWf8ICGZVqo
	z9JXjNPrGKahRZsQngwDKtJ/DIvS6VacZlxspI64wk8XWF8QuMXny+eWMEsyeFrps/b4K4QgKGP
	e7eBs3o28qK2rpy0XocUrEzhRVlz4oLq9g7XLJNj/LPMEwamttZiYzdfnmlBvK+39EtAxJDuM5c
	wNEVrzS3sXQfH4Il1xsuhI6XvFgF17e1L7NTGFt97FEV/7pG4nuztCMcmlDE3GbRrNz8LZ7GhQj
	edRUkWVQ9uo/njI0Rpa8eWpoKZFhj8UenUJtgqcFChr1UMmy/LH1KwuJqjawJ3Vkz8rQHn3/VwN
	kMvayZV2bdKGcu2KohhE7l8xHFeq854zig7T4TypWHxbtB51jUMt9pU5V4UYALasszrHIWqYhRl
	Y1wDYadyYXf59xD2eLaSKowSYym34smDx0nFbyNrlO9sXVKhSx5IBddIfW1smKwVaTdhy1zvJLP
	6XhxhTJI7QUdX8VC+sjVwHmcfrjjq2/8/zvext5fGnadq8=
X-Received: by 2002:a05:6a21:2c15:b0:3c0:9c19:6586 with SMTP id adf61e73a8af0-3c9009e7357mr3822070637.64.1785435242033;
        Thu, 30 Jul 2026 11:14:02 -0700 (PDT)
Received: from localhost ([2605:1700:2080:8400:db7e:78ea:6590:e077])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbdb78ae98asm2465383a12.1.2026.07.30.11.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 11:14:01 -0700 (PDT)
Date: Thu, 30 Jul 2026 11:13:59 -0700
From: Bart Nagel <bart@tremby.net>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, mathias.nyman@intel.com
Subject: Re: Regression: webcam freezing since Linux 6.15
Message-ID: <amuTKengDzr0IL6b@spiral>
Mail-Followup-To: Michal Pecio <michal.pecio@gmail.com>, 
	linux-usb@vger.kernel.org, mathias.nyman@intel.com
References: <20260723081440.0228c59e.michal.pecio@gmail.com>
 <20260723081440.0228c59e.michal.pecio@gmail.com>
 <amJ9jAtK8rNWDO7V@spiral>
 <amKUdIRBrsFiDTiV@spiral>
 <20260725115956.321185a1.michal.pecio@gmail.com>
 <ame6T_LjiJBeJ2W3@spiral>
 <20260728003131.085171ee.michal.pecio@gmail.com>
 <ampPGn-3C9PSEZQz@spiral>
 <20260730130814.65f7891c.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730130814.65f7891c.michal.pecio@gmail.com>

At 2026-07-30 13:08:14 +0200, Michal Pecio wrote:
> I'm slightly curious what exactly happens there (probably MSE after
> Short Packet on a single-TRB TD), and whether Missed Service Error may
> point at a Link TRB, because the current fix wouldn't handle that and
> the stream could still hang. So your failure rate may actually be
> reduced to 1/255 of what it was, but still not zero.
> 
> If possible, please boot the patched kernel again and run it for
> a little longer. If it fails, post dmesg starting from the "Miss
> service interval error" line which is followed by "All TDs skipped".
> 
> And while that is running, also collect another log:
> 
> cd /sys/kernel/tracing/
> echo 1 > events/xhci-hcd/xhci_handle_event/enable
> echo 1 > tracing_on
> grep -B5 Missed trace_pipe | tee /tmp/trace
> 
> This is supposed to log 6 lines for every Missed Service Error, so it
> will grow, but not terribly fast.

Before I make a bad assumption and collect a useless log, please
confirm for me exactly which debugging I should enable. Just the two
you gave above, or also one or both of the ones I was using before:

    echo "func handle_tx_event +p" >/proc/dynamic_debug/control
    echo 0xff >/sys/module/uvcvideo/parameters/trace

Thanks.
