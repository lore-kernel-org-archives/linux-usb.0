Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2D734BA50
	for <linux-usb@vger.kernel.org>; Tue, 23 Jun 2026 11:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782215724; cv=none; b=NKbuJuljAxROwRoLMd5GB9OlnfI7l/1rXWso9GdvvvoknzAC0m21Mx0YlybT14rDQ66N/eqq3RD0rDSpXpBo5icU767D0MCUfE6ASXzeKzGzyzsuZeRlrupC6sUje2PIMHHcbpaa+gQ/pRPciEQQ1JbvlYU+jMa7ZMBe4LdYR5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782215724; c=relaxed/simple;
	bh=h2Rwr37eMoGme/d9wKqtjK2U64WXg2RRslmQ/9OCDWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VsVDWeCMvDkybRh/Rzb/Bn1QpLlsyQR189imwDw3mu3h9XLf0pcOzbo25zzIO4+BmPJH6g/Mq/KJfnmREC3ZAQvnvw9kQWyqhbbC4ebrnA7RJEBHeu6osOHNZNgeufFlpbnznOH3muwNIfu9kcuherer17zz5ctGer+b+J+rYoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NOSCPC+A; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NOSCPC+A"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49249707788so23801955e9.2
        for <linux-usb@vger.kernel.org>; Tue, 23 Jun 2026 04:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782215721; x=1782820521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lx0STp9J5MD57IIANrpjIDVf2U7oRAYtvaIvJeF38Lw=;
        b=NOSCPC+AdZS7XjzzPf3YH5zhsi6PcezFTVP9rr9WzHZNx67chgHnIH+xQtVeuIy3oy
         WbUjeg7HzoE8o0DWW/SYogLYK3zuGcn8xmHjI9PXWGEAW7d3zsLRk8qOyUOB5Q/Q+znA
         uN70PyNf2vLjwgWPW9+IKW5NEJVEJQ1oJuHF37wJaI/hJS5Mfk8YqcVciZr8BeClEcXC
         ESb5jAfaLB5bt7e2LXRW0CYxUVI+RjViUOH4NDvt+ZHrRxFJuPBDoRiDMpN8vRklkS5U
         FRYgYJyE5kPPjUOsC3PozGmma+zxPV38to7EBS1uH/X4Gj0WglPNTAJtPpl2+tU702iI
         f/nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782215721; x=1782820521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lx0STp9J5MD57IIANrpjIDVf2U7oRAYtvaIvJeF38Lw=;
        b=cH1+EGkuBo17DsEtQ60VzmExFW3+utOzDblR6ntoI3/q+0dusRb90kW6l8adwO2vuQ
         diR0sF9en1YrW7biJoZAbUqf/U66tloBuMC2Ov3rQlcGlldR3UVYM7pOXxS+NuTcXMwF
         yQO2LjOdUny4rqpUmVVIWN2XX80fR14lHnp2I6YVC4KghKAPLnwqCg3O6/mT6RMUSN3Y
         Ba/M2Kuh1koUZ79uWZP5COtdFeEi00loGkFET8pn8gYITNhqHR0eNn/mE2noFcFyZIKh
         qWzlg+aVf02geFa+6WdDhHQROhaNoaloGbKxUGwKtNe1xkTeJrMILlD+FbBLLJWOZtyI
         IoKA==
X-Forwarded-Encrypted: i=1; AFNElJ8DI1Ih5RnQxcrEkzfE5T3KDiKGYFVX0pJCZ6cV4QtP0gTN8xtMXxT1D9XCNZd0LEp0OtaibgVD5RI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNKqclu7PL5QtebEHKBMt8WJ4pVsUY/IMV5EGXKRwzmrqSpsP+
	8lA0QU34hBPf2CCC8q9GQF6tbaa8hCJDAiRl9z2cE6uUCOx6uy+kUSqh
X-Gm-Gg: AfdE7cnqxYec3xEyovKYFd7Bv8nidYkmqLWJrqe+Cuihb1DySgsOxOWjBYenDFZIQqG
	NxuNOxNilH/ABxHFfzGI2YCp8vF+cHaGN0zaAVbof3NZZLv5XK9PwKs8sXJZOlwewkZn4ydagqR
	Iv4wMffj76SZBI1vTBQszDKTo0AORFr3cP08wcHAtn2sdInZWemgj2lX6rv/fo1BiMaW+xKCVaO
	j0HXdwOfa2y24lOa5kBkzphwFiqbmrQiD/TqkGB06eMMxKy8dIRZOAx4GMzwzvcrCsEZxAKwjFE
	c8IxVqf42Rpd5uyCdhcckIg2Eo5ukEQblmGoD6x6i30y0HlTjC27WzIBcXbwUk1lZA6xImyap9c
	eV2xELV4ICYKUT9hCo1jIdWqGQMLUDR2uR/ilvxo/W2K2OLYl7vWg8XORES94+doVGjoRI1cYJl
	+XpI9xGkLTpsAh/sLyYOBQNg==
X-Received: by 2002:a05:600c:3113:b0:48a:5565:ec3d with SMTP id 5b1f17b1804b1-492490a790cmr200461135e9.22.1782215720987;
        Tue, 23 Jun 2026 04:55:20 -0700 (PDT)
Received: from foxbook (bfg19.neoplus.adsl.tpnet.pl. [83.28.44.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492494496d8sm289452405e9.9.2026.06.23.04.55.20
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jun 2026 04:55:20 -0700 (PDT)
Date: Tue, 23 Jun 2026 13:55:17 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: raoxu <raoxu@uniontech.com>, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 mathias.nyman@intel.com, stable@vger.kernel.org
Subject: Re: [PATCH v2] xhci: pci: Disable soft retry for Renesas uPD720201
Message-ID: <20260623135517.2b1f0809.michal.pecio@gmail.com>
In-Reply-To: <c4ef0081-fbe9-47a4-b5d5-60665564ca02@linux.intel.com>
References: <20260619124234.0a9e4670.michal.pecio@gmail.com>
	<237BFC17C62D63DF+20260622062117.56278-1-raoxu@uniontech.com>
	<c4ef0081-fbe9-47a4-b5d5-60665564ca02@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Replying a little out of order here.

On Mon, 22 Jun 2026 14:31:58 +0300, Mathias Nyman wrote:
> Cancel the realtek URB we tried to soft retry earlier.
> 
> > 2026-06-22T13:23:39.477082+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: 8/6 (000/3) [200cb341b0/200cb341b1/200cb341c0] xhci_urb_dequeue cancel TD at 200cb341b0 stream 0
> > 2026-06-22T13:23:39.477082+08:00 uos-PC kernel: xhci_hcd 0000:04:00.0: 8/6 (004/3) [200cb341b0/200cb341b1/200cb341c0] queue_stop_endpoint suspend 0  
> 
> queue stop endpoint to cancel URB for realtek device.
> Endpoint context still shows endpoint is in "stopped" state.
> Note that we restarted the endpoint 20ms earlier, endpoint context
> might not have updated yet.

This was business as usual on uPD720200, it seems that these chips
don't update EP Context until the first scheduled service opportunity
(though no later than about 30ms - long interval endpoints must have
different rules) and they cannot execute Stop EP until then either. 

Some of them complete the command with Context State Error, others
delay completion until the scheduled restart. If we wait longer and
then queue Stop Endpoint, it executes instantly (fraction of a ms).

It seems that 201/202 chips still have the same limitation.

> I think there are some steps we could do to avoid soft retry,
> restart, and stopping an endpoint we know is behind a disconnected
> parent.

Yes, existing logic can be trivially extended to cover children too.
Of course, this does nothing if the device is disconnected from an
external hub or a transaction error occurs without disconnection.

But further experiments indicate that disconnection from the root hub
is actually a necessary condition to trigger this bug.

If another SuperSpeed device (even one without periodic endpoints like
UAS) is connected to another port, the retry causes another Transaction
Error a few ms later, the pipe halts and Stop EP completes normally
with Context State Error, as expected. Then we reset, remove the URB
and never restart this endpoint again.

The same happens if I trigger the bug and then connect either the same
hub or any other device to any SuperSpeed port before command timeout.

[  +0,000009] xhci_hcd 0000:06:00.0: 6/6 (000/2) [ff8f0bd0/ff8f0bd1/ff8f0be0] queue_reset_endpoint tsp 1
[  +0,000009] xhci_hcd 0000:06:00.0: 0/-1 (fff/f) [ffffffff/ffffffff/ffffffff] xhci_ring_cmd_db cmd_ring_state 1
[  +0,000504] xhci_hcd 0000:06:00.0: 6/6 (002/3) [ff8f0bd0/ff8f0bd1/ff8f0be0] handle_cmd_completion cmd_type 14 comp_code 1
[  +0,000025] xhci_hcd 0000:06:00.0: 6/6 (000/3) [ff8f0bd0/ff8f0bd1/ff8f0be0] ring_ep_doorbell stream 0
[  +0,006627] usb 10-1: USB disconnect, device number 22
[  +0,000016] usb 10-1.4: USB disconnect, device number 23
[  +0,000005] r8152-cfgselector 10-1.4.4: USB disconnect, device number 24
[  +0,000190] xhci_hcd 0000:06:00.0: 6/6 (000/3) [ff8f0bd0/ff8f0bd1/ff8f0be0] xhci_urb_dequeue cancel TD at ff8f0bd0 stream 0
[  +0,000011] xhci_hcd 0000:06:00.0: 6/6 (004/3) [ff8f0bd0/ff8f0bd1/ff8f0be0] queue_stop_endpoint suspend 0
[  +0,000009] xhci_hcd 0000:06:00.0: 0/-1 (fff/f) [ffffffff/ffffffff/ffffffff] xhci_ring_cmd_db cmd_ring_state 1
[  +0,000655] xhci_hcd 0000:06:00.0: 6/6 (004/2) [ff8f0bd0/ff8f0bd1/ff8f0be0] handle_tx_event comp_code 4 trb_dma ff8f0bd0
[  +0,000023] xhci_hcd 0000:06:00.0: 6/6 (004/2) [ff8f0bd0/ff8f0bd1/ff8f0be0] handle_tx_event stream_id 0 trb_len 2 missing 2
[  +0,000013] xhci_hcd 0000:06:00.0: 6/6 (004/2) [ff8f0bd0/ff8f0bd1/ff8f0be0] queue_reset_endpoint tsp 1
[  +0,000008] xhci_hcd 0000:06:00.0: 0/-1 (fff/f) [ffffffff/ffffffff/ffffffff] xhci_ring_cmd_db cmd_ring_state 1
[  +0,000012] xhci_hcd 0000:06:00.0: 6/6 (006/2) [ff8f0bd0/ff8f0bd1/ff8f0be0] handle_cmd_completion cmd_type 15 comp_code 19

I would guess that disconnecting all SuperSpeed ports causes the chip
to turn off its SuperSpeed schedule altogether and wait for SW to stop
all endpoints which aren't halted yet, but in case of pending restart,
Stop EP is scheduled to complete at the next service opportunity, which
never happens.

I also found that disconnecting a different affected NIC from the root
hub itself also triggers this bug, but only if I disable protection
from queuing Reset Endpoint (including with TSP) to "inactive" devices.

And the bug doesn't trigger every time - sometimes the unlink happens
while Reset Endpoint is pending and then its handler removes the URB
without Stop Endpoint.

And cable connection isn't actually necessary - I was mistaken due to
the randomness of the bug.

Regards,
Michal
