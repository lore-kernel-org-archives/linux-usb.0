Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CA432860B
	for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 22:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785449796; cv=none; b=h+7RLu4AGMVz7Wrn0jx0qpwdJL4WKZbOsfMUWFjRrHh8s1nlOEYll1Xi7C3txv2WlxQXRr7mI2UAam8D6pTwWhVW592nSu9YOiN++7dARvTBphlnn0ALsVN8czseBdV0Qx30DV+sXV5MLvalCMhfPcpPgI+nZsJTdKCT+u7rdVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785449796; c=relaxed/simple;
	bh=wvY0oGYTALsZuvHbLGV/XIczegpQvXu6UIQvpB2ipd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NtBcZOH92yW6pP2aaqnm+KocY3Lfx2y80S/n64Ed0fEQdCRFJwxbIjnYGnv+JY6EF59NryDNwlFQ5apBnfwvHx4UZ9YcJs+8V6qsllJNtpGbZnSWFvyProNdDQT5QMxePN5ncuRj/YzoI3by31ir7hB3pKEYdxlgpKoPcIRfDVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tremby.net; spf=pass smtp.mailfrom=tremby.net; dkim=pass (2048-bit key) header.d=tremby-net.20251104.gappssmtp.com header.i=@tremby-net.20251104.gappssmtp.com header.b=cjOzB7uH; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tremby.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tremby.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tremby-net.20251104.gappssmtp.com header.i=@tremby-net.20251104.gappssmtp.com header.b="cjOzB7uH"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8487088510aso448413b3a.0
        for <linux-usb@vger.kernel.org>; Thu, 30 Jul 2026 15:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tremby-net.20251104.gappssmtp.com; s=20251104; t=1785449792; x=1786054592; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Plo0MlMwh2tNCG9SnM3S9tfw3WsqH1D32VPURg7GdEA=;
        b=cjOzB7uHcO3rpIY1ykxAHxSiMxzFNXjzW2almcu86ph0uuxtXeoN2nanX7A0l5T/Fs
         2EMw0RBxfdQi1L5fBRQjcgP8mgDvLEUgocp9JhoRUBelbRUNF81pD3OsDlNU8lI7BUMb
         SqcGYXej2PjRyFeagu0yA4BUc40flNFv81fYQy1Mp/siQBwWFUvRs1z3PngOVsWEFoQW
         BUC6LUz5aswj48klgcS2VGZB6qGVO8Qsu7wlI/Y5QMdPCnt/hO+w1Tub/rr2NLPLz3pR
         16GkJ9KzntGfJEye5PDZOIE/Ow0PoAVWt/NMDQ1/WMiKYW3l8+vuOALpYw/5fO85619N
         XV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785449792; x=1786054592;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Plo0MlMwh2tNCG9SnM3S9tfw3WsqH1D32VPURg7GdEA=;
        b=UeqBIXL+eIdWzShZmxY0HSfoNHFEpzr1Xnubreibxiva7yWHchSUBf+tcVT2L3fBXm
         sTDGS48kPoyey74WLf6V6O1CWqu0FvkaiO0UtyNtfDRBBTwYV/p16rgztYaGlX/k3KNj
         DGj76iLVgVFAY/aCGVgp8bZlvUlxvcAbGVVl6vz7jKeenT5geSuFcyB2eo80Sy9eajkA
         hNbwEtdasIQrvtZR4SzFBjI7GwW6XoLj8x7//Xq/mvfIbYMqAjWuU/vtaRbo3CD+lLxc
         5Sc2JKZiyX92SBYqGhT3/w0WLTdx5XLw/WY3dfPN2lipkgd4b9C98k34QHeKxMdrzdxB
         5rhw==
X-Gm-Message-State: AOJu0YxjWhkqEpdDgSWi+t4Tp5RmDj7JwnDfZs2Ok+AaP8PEmiU8JI5z
	mNPuezDAULT69q2VSxOZtcnF6Y+EvLFyhzBKbYSsf9rrqX4ZsTh0vDjtJ8/4UuFFCQpM/5GGxrG
	HdQ2qd6RKUg==
X-Gm-Gg: AR+sD11nKbymW38lJY0x+EDSdqwAF3aIsUFaqKjEGnxufYstsfR/nEnT3oW9/hJWwpc
	OfDoTcEuD612t4HD5MtNmyKTH1S3EanwNrs2SZ3L2FAwCLmvs8bSYUmYXJ5GLYZIhzpBCy6Mr1k
	/YTzQ1SIBfND4l3eVWqZHgyGK5Zg/tUD47Ce7Sis6QpUIFtpMvgqSRi5hosSlIuyN9whvaCDqJJ
	9Zuaf/NvUAFd5BJKMXKzTaB2y23hJmhkqRVe+P/7xR+wo8vwv0uHGmcYY3gAVZBHg8x/9jwN7lS
	J6AeSXk5I5KdfHLkfF1Wq6LfcKLRDNlVPU9D60HN2fmSAx9ILiOTNtQFh1afH69Qso4zr7oWp/H
	e0Ma9lMvTx5zqvFZ1zKpZdVhcisInMzB0ExEk2ylPaW+Qwh2uJPF0OvSlLl6dpjIpeCKZq11Ovs
	llsSfIR05YcHbI9MoF4YkKTikKF8HiUr6cN/Up+u9rCggMWwkalTbcCblH2ozMg0OaQGZZA4xcw
	RYdHcF/T9R0RTag2HtuaFwI9diW1i3YWU7j8ZnNHd4uV5E=
X-Received: by 2002:a05:6a00:4093:b0:84e:c851:a054 with SMTP id d2e1a72fcca58-84ecb9ba4demr1389053b3a.77.1785449792248;
        Thu, 30 Jul 2026 15:16:32 -0700 (PDT)
Received: from localhost ([2605:1700:2080:8400:db7e:78ea:6590:e077])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea02fa474sm3605628b3a.30.2026.07.30.15.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 15:16:31 -0700 (PDT)
Date: Thu, 30 Jul 2026 15:16:29 -0700
From: Bart Nagel <bart@tremby.net>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, mathias.nyman@intel.com
Subject: Re: Regression: webcam freezing since Linux 6.15
Message-ID: <amvLNSih7i1iyHDM@spiral>
Mail-Followup-To: Michal Pecio <michal.pecio@gmail.com>, 
	linux-usb@vger.kernel.org, mathias.nyman@intel.com
References: <20260723081440.0228c59e.michal.pecio@gmail.com>
 <amJ9jAtK8rNWDO7V@spiral>
 <amKUdIRBrsFiDTiV@spiral>
 <20260725115956.321185a1.michal.pecio@gmail.com>
 <ame6T_LjiJBeJ2W3@spiral>
 <20260728003131.085171ee.michal.pecio@gmail.com>
 <ampPGn-3C9PSEZQz@spiral>
 <20260730130814.65f7891c.michal.pecio@gmail.com>
 <amuTKengDzr0IL6b@spiral>
 <20260730235953.2d51e0cc.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730235953.2d51e0cc.michal.pecio@gmail.com>

At 2026-07-30 23:59:53 +0200, Michal Pecio wrote:
> On Thu, 30 Jul 2026 11:13:59 -0700, Bart Nagel wrote:
> > At 2026-07-30 13:08:14 +0200, Michal Pecio wrote:
> > > I'm slightly curious what exactly happens there (probably MSE after
> > > Short Packet on a single-TRB TD), and whether Missed Service Error
> > > may point at a Link TRB, because the current fix wouldn't handle
> > > that and the stream could still hang. So your failure rate may
> > > actually be reduced to 1/255 of what it was, but still not zero.
> > > 
> > > If possible, please boot the patched kernel again and run it for
> > > a little longer. If it fails, post dmesg starting from the "Miss
> > > service interval error" line which is followed by "All TDs skipped".
> > > 
> > > And while that is running, also collect another log:
> > > 
> > > cd /sys/kernel/tracing/
> > > echo 1 > events/xhci-hcd/xhci_handle_event/enable
> > > echo 1 > tracing_on
> > > grep -B5 Missed trace_pipe | tee /tmp/trace
> > > 
> > > This is supposed to log 6 lines for every Missed Service Error, so
> > > it will grow, but not terribly fast.  
> > 
> > Before I make a bad assumption and collect a useless log, please
> > confirm for me exactly which debugging I should enable. Just the two
> > you gave above, or also one or both of the ones I was using before:
> > 
> >     echo "func handle_tx_event +p" >/proc/dynamic_debug/control
> >     echo 0xff >/sys/module/uvcvideo/parameters/trace
> 
> Yes, please keep handle_tx_event, otherwise xhci_hcd debug messages
> won't show up. UVC trace is not that important.

Ah, good, that seemed most likely and I did start it running. No
freeze yet after close to 4 hours.

Is there anything I can grep for in one log or the other which would
show that we're down to 0/255 chance of freezing rather than 1/255?
Else I'll just keep my CPU cooking overnight.

The trace log so far is sometimes getting lines starting with various
things such as stress, systemd-journal, PTF yeader, tee, grep,
PipeWire thread. Is this as expected?

An example which just popped up:

           stress-62735   [000] d.h1. 41416.344013: xhci_handle_event: EVENT: @0x000000010fb9c6c0 TRB 000000010aea66e0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
           stress-62735   [000] d.h1. 41416.344013: xhci_handle_event: EVENT: @0x000000010fb9c6d0 TRB 000000010aea66f0 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
           stress-62735   [000] d.h1. 41416.344013: xhci_handle_event: EVENT: @0x000000010fb9c6e0 TRB 000000010aea6710 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
           stress-62735   [000] d.h1. 41416.344014: xhci_handle_event: EVENT: @0x000000010fb9c6f0 TRB 000000010aea6720 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
           stress-62735   [000] d.h1. 41416.344014: xhci_handle_event: EVENT: @0x000000010fb9c700 TRB 000000010aea6740 status 'Success' len 0 slot 7 ep 3 type 'Transfer Event' flags e:C
    kworker/u33:4-79857   [000] d.h1. 41416.344172: xhci_handle_event: EVENT: @0x000000010fb9c710 TRB 000000010aea6750 status 'Missed Service Error' len 7168 slot 7 ep 3 type 'Transfer Event' flags e:C
    kworker/u33:4-79857   [000] d.h1. 41416.344297: xhci_handle_event: EVENT: @0x000000010fb9c720 TRB 0000000000000000 status 'Missed Service Error' len 2048 slot 7 ep 3 type 'Transfer Event' flags e:C
    kworker/u33:4-79857   [000] d.h1. 41416.344300: xhci_handle_event: EVENT: @0x000000010fb9c730 TRB 0000000000000000 status 'Missed Service Error' len 33792 slot 7 ep 3 type 'Transfer Event' flags e:C

I'm sometimes seeing some "USB Transaction Error" and "Short Packet"
as well as "Success" and "Missed Service Error".
