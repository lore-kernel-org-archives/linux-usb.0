Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793014734;
	b=PPAc4l24epeAIo2vS/SWmUdyBZ9gJ8t2xH9nfTKwUvazeBT+4K7NxLq0haLTqwjpa7l9
	 ZVwWXjp+QjhxZTmAzgEAOGRtMhNjNIrjciiTsxfF7tuFb4z/CVKFwdQiKn4WTprkoKic/
	 kROIXSPPLcxyWpgIyNEupQYeG78mjA1nj1gNJGz15OyJoaE+MaIkRvfZDSnvlulWJhc9D
	 j+bwXNqbdpxbwTkSqy3SS+/V+hKar1adQM3HrSbL5hbqnfC4z7uJI44YtJi7XDQkxnlVE
	 LahCq3FVL9EBTs+2BXVLCBaqc4LGqj6OkU1bOo1NIER8PvoNQUetnyNItQ/Qt1fK6qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014734;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=lGTCUVwBVhHA0G6XFL+3+lxo/iNodYNJMNP7+hVT0qg=;
	b=hAdcHj7zb5HckZhAuZTRqk7x9Tvk90/1G5qqJv66OLoUZzqHXjbEBlcUa19hVKmW1PBg
	 AQ/sD/TvEBCwDh31EMauwoLjh8x8rJaoSEgwoe4AbIn+uM0Stiig8Qy0MPzOeS+JF5gnk
	 upWwDIdbkyHdlbl5TzAbedsFbjinpMYOqQCJzJ3riAH7yQjtZivaVBVou3PE38JbU7Vhh
	 1AJ5MuX2ierH8O0NCS3l9WNIkWoJ2O6NZkBLWouLmcNnfKX/Avwqo+hA84WCvyYmqO+CH
	 APSnM9r7EHZP7a9mrszfZRwo2B1s56Ta//70gqTSmo1pIleOhBiVGFOUiAfzX5l6TbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FnEmO9re;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E1B606A31E
	for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 11:38:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40E1B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FnEmO9re
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso2622319f8f.2
        for <linux-usb@vger.kernel.org>; Mon, 26 Oct 2026 04:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793014733; x=1793619533; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lGTCUVwBVhHA0G6XFL+3+lxo/iNodYNJMNP7+hVT0qg=;
        b=FnEmO9recpGSfcsYzSTlnf0d+rlx7IqBMiP243OolLAbM235DqtUAuJKXq/H/nkYeK
         yPxZN/uY5Uq76AJ3mEEuWIkiR5m+yAyZIoNxvXoiJUVQFkzc0DK8xkrd5i6ZtXcMkT8R
         p/eaCx0sbD0vfkkH9i3dK7eqDNSccgAJxs98SUwNw+Zrw2Q2awgDEILz+B/LlFJw4KhE
         yeXRApMNT9n+H5Gopvcsq+o2ow7vltY86QX2lsyarg7ptRufp6PnGfa8A/62TG32tYIY
         K+7y3HbWh5ZCRzO609tD37Ys5UHo5KRJngcjBZURoGbqch7pbZbf7zZrd/xrejdKRpZY
         SOXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793014733; x=1793619533;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lGTCUVwBVhHA0G6XFL+3+lxo/iNodYNJMNP7+hVT0qg=;
        b=D/Di0eK0zRxKbwG5dxY1FCYOnk84WmmDa7vPliW4W8oT58Kq0+pYq39r3gWOpmX9Tw
         lUddfbV9LtKb8o8YVYCJO2SJzHKZsTbRVoas1LWbCEJS8sCfdUGkzQ5kuu1RK1yIUYjQ
         CObLgZFsne1iBTHSo/e3DbCOyCmHMKj5P7aHmuttwfNeAmvPThRjQQAlpNYb38Adw03/
         12lgfKbFWWHRh2put0d3/YpWl/aiKD4Nb6RnRYIR5ZGH5lW/16IT7CEsNtYVM22MR5Wu
         FjDFbYAxD/bPrCtyokvd564jzHKGTAdbB8EAUcqzYoQOKWeoFzVpkDapAk+4jD/DWvaV
         vceg==
X-Forwarded-Encrypted: i=1; AKwUvBxrWRTLliBv17AeV9FUfq0gOYOI/wVikPkrKXPqMYuX2MyNrK0vzlylBKcdVOh4iAJxcawolZZ/GEU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqfTzoOHaStDSlJEW8le0sElxOIuYCwzGglo/T6lMCw9frTru0
	BgrG2q3bqsNUAmPYzNH2pU1GwrM2f42YZ9nQDh+BwNPUyUrsT7DPdOED
X-Gm-Gg: AYBFou3dw4chKTOQd+z6vSl8V5sZlxs38Gqpuaa/UYJEI6vGp3Fd690G834IPE+IWpC
	WwCTUxcuhem/KXS15Xp8lHuBKZliB5aIBB+f7mZQjy9JdLroOQniY7yF9y8XD8ImC6cDazdpGpQ
	xYRxAe/lmS60cuBPTevT6AhI85dxP8TBMSebVKBX3OWtJQxrawK2y30E9zc5fdK/b2snd/8hoLP
	XB2STHD8Ny271rhNLlrrXgTBm8vhkGOGNYpeBDcqMOTlaXia9c1JnY0CY7acRZ72gfBApalbXa5
	VnXZDNnMqxMn9fLYCErDd19RrejbeMBL+2tEw2Me4qLtmqMrSIUjmk3Wd7oCS1yQ3oN+l4eHVkS
	oxA5uNaWMVlHO3170vMmTJd5LFWjuBIL5w9kWnEY4hjUH/OyRxcLYitB5F7Sj5FZQ8lJQjpsY2L
	D3Af1c/XBGGIOqHHxMSUAxSoVJ/0w2LRzH/5cEebE/TGRdu6RxDoerZCQf0uR25i/idl2G4u4ku
	LcfcIhJ4cOtZoPjF3hdn2E6qaQG6BCZXKCUjp8YkXJesYgJpAkcXNvTpR6Vydt/
X-Received: by 2002:a5d:5d86:0:b0:48d:f996:1814 with SMTP id ffacd0b85a97d-48e3eb9c7fdmr11109704f8f.57.1793014732636;
        Mon, 26 Oct 2026 04:38:52 -0700 (PDT)
Received: from foxbook (bgu81.neoplus.adsl.tpnet.pl. [83.28.84.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd49afsm16227058f8f.35.2026.10.26.04.38.51
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 26 Oct 2026 04:38:52 -0700 (PDT)
Date: Mon, 26 Oct 2026 12:38:47 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Dennis Wissel <dennis@dsine.de>, Yiyu Zhou <yiyu@yiyuzhou.io>,
 linux-usb@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [REGRESSION] usbhid -110 timeouts and reset loop for Keychron
 M5 (3434:d068) at boot since v7.3
Message-ID: <20261026123847.365209e2.michal.pecio@gmail.com>
In-Reply-To: <20261026105139.6b86cb3c.michal.pecio@gmail.com>
References: <4MjB9K-2SoiA85WbI9iEig@dsine.de>
	<20261024203558.3181711-1-yiyu@yiyuzhou.io>
	<SrQQcLIwRWyg9PdEIpc0eg@dsine.de>
	<20261025111410.2c14fcef.michal.pecio@gmail.com>
	<7082e2e7-8d05-46b8-a26b-5b888a7a0545@linux.intel.com>
	<20261026105139.6b86cb3c.michal.pecio@gmail.com>
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

On Mon, 26 Oct 2026 10:51:39 +0100, Michal Pecio wrote:
> On Mon, 26 Oct 2026 11:18:34 +0200, Mathias Nyman wrote:
> > So even if we give back all pending URBs and clear the
> > EP_DROP_PENDING flag we continue using the stale ring. We should
> > either either move dequeue pointer, set TRBs to no-op, or clear and
> > reinitialize whole ep0 ring at device reset.  
> 
> This may need to be fixed regardless, because EP_DROP_PENDING on EP0
> can result from xHCI "Error" aka USB3 "Inactive" state, which (AFAIU)
> may be cleared with warm reset, without reallocating the udev. That's
> the "existed since forever" issue I was thinking about.

4.6.11 isn't 100% explicit what happens if EP 0 is halted at Reset
Device, but generally it should "terminate any USB activity, abort
any pending events and transition to the Running state".

So just a Set TR Dequeue to current enqueue will probably work, but
I think this has never been tried before.

I see that xhci_discover_or_reset_device() clears EP_DROP_PENDING
even in case of Reset Device failure, which looks a little odd. We
probably wouldn't want to issue Set TR Deq in such case and don't
want to clear this flag without fixing the endpoint.

What was the reason for placing this loop after and not before
the command_cleanup label?

command_cleanup:
        for (i = 0; i < EP_CTX_PER_DEV; i++)
                virt_dev->eps[i].ep_state &= ~EP_DROP_PENDING;

        xhci_free_command(xhci, reset_device_cmd);
        return ret;
}
