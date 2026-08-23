Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CEA1F5834
	for <linux-usb@vger.kernel.org>; Sun, 23 Aug 2026 15:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787498694; cv=pass; b=ggwcDBYxXu8VvBkLOBenv/HjR3Vmba7bM1zAE7qXfXAJEQSVJrtVBOd5F15poFCQbuNlaq1Bp0kHDNynn1Bh26Jy/QCVGnHI/KXo6wyBr4LR6JGqi2dpB/2tXgfjiC3IQ86PhU8WrA3R9cQX9p247YSWodSXsMVPe+13QyEaN1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787498694; c=relaxed/simple;
	bh=/FVjCV2dDHJsQGhC6PflAhRNp3MozOqai329s9Bmjho=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=XGkY+l5GdPET5mMO+AFNUXe2pIhRhpO5hKqS19O/YUqpLYt88ffmUJ4430z41eWJVSnl0RV6uMACBvUzdOIT1ZmBx8Da8pVUo9uZ6HcCottMMymgDoAyXfUt2qfRD3asyQO0DfSl9OB+ngfpdgN2U4iWxfWUQgbhfrsxpxX+8DI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f+We2+jj; arc=pass smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f+We2+jj"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38e7109321dso1703304a91.3
        for <linux-usb@vger.kernel.org>; Sun, 23 Aug 2026 08:24:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787498692; cv=none;
        d=google.com; s=arc-20260327;
        b=Vlg2I4FONqADDDsWTrJbx0DERa6VgrD+jbcIIY5y1bHWw+VAtP0KK1yLEjrSTW4iMS
         ElE7lE88qLOWz5Dj/fpTkgcX3mUNobI9p205P2rCJMbCw0dv+XAmAd6FQx0KdazmcB3g
         kpVpeV9kjVRWvCzZxZkmvhX6toxiwbsoaaZupN8Vuz7E5UpdZYalA2lgnZFY8Z27yd0F
         bSwVmRUyhSJCqCNDwauitRjk++1lcoW1Tz8+W6Dj0zyjlfoED2hhuy+1sfL9zGoACIfY
         OCzzpo/eU9fiGyOSzVCP4fZBpBj3+A+hQWHd4vXfErqIBbGhc9wxV0CYhmmGHodIfPsV
         io4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=o/rsVqEXqt/LBY8IhUeCC4OyHwNQ1pTzJ7cKscOB+6g=;
        fh=O2IiVwOv2nS03XKHFs4H6qzdw9UGXaHNPuIUwz7Mf4E=;
        b=YXtjQ8eGHsPwtBHa+S1OO1FHl4MxcGdz8eMR6xpf9OHLWQHkn+xTtFi4qzfQRT/b17
         U0zQJYmg9AGW5DIlz3T/EKTHLWrfXIsxGbMmhx8RK3/zKEVSH21Rl6l+1j29A1uttH7L
         86d7AsLeJ8GqOFdXeUgs5MmAYcVqRI/XiQMH54bofewW+MqD8sbIfgWv/zUShzLUxuUM
         1K5QzKEzRe77Bdh09nAI4uwgPnkCD6EqblsNEi6hlNJK+EdNKOpQNo9UbvnNvLEfUOMr
         DwGuZuEzvweELyP/ynbESg6SDtiDjvT5UWjjm8oQbVUWCl3mw2DV5F2GVUh/yUar7Tvc
         G5Qg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787498692; x=1788103492; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o/rsVqEXqt/LBY8IhUeCC4OyHwNQ1pTzJ7cKscOB+6g=;
        b=f+We2+jjZt1CudmkpnN35IVbNePcWku41qaPcVkV8g39BnJKQrCNDlzySuW+7ha3Jg
         RSrhuZA43J84slj9LD7/qfwT8Of92Y3vZreQnaJdc3XRyeW9FUr0w4E9AoUDMDF5+MzJ
         dEBVCDqwPOChfuVHcbWKoBjHS0MWIP/3uCnO0EFyuRiYBYrWTcntjQBezMCLJlw5gL6g
         9kVlDxjthuq7F1GiIMLzWpP2edMLYvc5vwDSPrwMPPVVxoID0eaB3WI07T4GWm14Z3Ln
         pth0Rgguz8ngFGnInJQ6rVYI92yHdOrydWZa7UQ4hSkxVIVKJhXyMrdXu8D6tkkWyS+H
         S3Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787498692; x=1788103492;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=o/rsVqEXqt/LBY8IhUeCC4OyHwNQ1pTzJ7cKscOB+6g=;
        b=q9OSqakkuap5xX/d1awQ0TObZrzMQUMoBE/cBA5DBpWaHjdS1CpkY/9xwUhjSFAfjk
         EQ7HbiuujcUEfKgJUphniiC4X0kn8rcbfig8DpIywbh/9CUIKs93HUsqYUk9mUHkKLvr
         5qfJ2EXOZlIVFoirLNSS09LTIw3O3SirTWbig+nTlm1t5dizbygzJKU1nNPlw4UY6jY7
         i99HHBIEXBI37L6rvzXR6QXgnb82OUl0FhB5l7d1LaYlwuZ7NYtHvt98d37BNOYNckBg
         Ibwrie51aFwBhzF6mqiHBHORrrWsQEcHs7tu3VdAA+QUeXf9NMJisyAcOQ4rZLqSv+yr
         nD+A==
X-Gm-Message-State: AFuF++kvn+sm59ocF4rf3mKsL41NUf7LC6ZvRdIZR0vwZvfolnGDnwcA
	zmeOeTHAIy/NLznLvZfr6eaPcLtx5joi/4qy0cYvkE80yUm3Dj7YOsnaOH6H9cQtSjQuzFRaR3t
	6muRiPAXdhuVBKjo9S/8JaTdD6PCQvvy8MayoO/c=
X-Gm-Gg: AR+sD12yALizK8ZI1iVd3iEDTvzlwQUcqZT359kGElXgRgVO5HtKlzXKwcKyOYUYQzx
	ztv7uD/fXjCswo155qGriNGnOt5Xfo7iqMDGGngfTIzt8M6JJIDP2Dk6gkg0AU5wvjIiZh8rC6G
	rZ4oWq/bw5ZdCEfzJroiT5DIE73ST9KAU/3cZIy8ShDTAukRXtYfBqvSd3GMOlzFmA2cgI1Q7Vh
	fjvsNUpoIo1bD2VKCmWo2kc3kqxRNWau/3o95bkOch7HM3+wNKcRWgeo36BHGF1I41DCog7ZTFp
	J0OemB9Z70QiJCG2QDmFEuxiiGFqemaeq3MlvYAAmzc3nJMbxswxkj7wUBvfrrN4tp3k1KGkxM0
	nWqLnZxkcOFCZonCT3ClJ3opnAqI85g==
X-Received: by 2002:a17:90b:53c3:b0:38e:5c6:4db9 with SMTP id
 98e67ed59e1d1-395c39cbc42mr36614552a91.11.1787498692054; Sun, 23 Aug 2026
 08:24:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Dennis Wang <wqingxmu@gmail.com>
Date: Sun, 23 Aug 2026 23:24:40 +0800
X-Gm-Features: AcwNN1WRNtkb7XBZiu8lfWGYRthEaiaI5t-JlaEKxfUtHUUCgf1AkXiobwJKUv4
Message-ID: <CAOX-mXs0ZjpiLtviUDqHLrzWh2Dyz+Y9gZUcenW_yV4iQUa=7g@mail.gmail.com>
Subject: thunderbolt: DP tunnel activation not retried when display NAKs while
 settling after link reset (Apple Studio Display XDR 2026 on Panther Lake)
To: linux-usb@vger.kernel.org
Cc: mika.westerberg@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On most cold boots of this machine the connection manager gives up
permanently on DP tunnel establishment while the attached display is
still settling after the host-side link reset (the display stays powered
across host reboots; what matters seems to be whether it has recently
completed a successful bring-up with some host). Recovery only happens if
the display times out (tens of seconds) and resets its own TB link, producing
a fresh hotplug; when that doesn't happen the screen stays black until the
cable is replugged. The same display on a macOS host connects immediately,
and "warming" the display on a Mac and then replugging it into this Linux
host also connects immediately - so this looks like a host-side retry-policy
difference rather than a link-capability problem.

Hardware
--------
- Host: ASUS NUC 16 Pro, Core Ultra X9 388H (Panther Lake),
  integrated TB4 host router (8086:e433 DMA0), Intel retimer 8087:d9c
- Display: Apple Studio Display XDR (2026 model, TB5 upstream, 5K@120,
  internal hub is Intel JHL9480 Barlow Ridge [8086:5786])
- Cables tested:
  * Apple passive TB5 cable  -> link trains Gen3 x2 (40G total)
  * generic USB4 20G cable   -> link trains Gen2 x2 (20G total)
- Kernel: 7.1.8-arch1-3 (Arch Linux), xe graphics
- Software CM; bw_alloc_mode active; display requests TWO DP tunnels
  (main sink 12750 Mb/s with DSC for 5K120, second sink)

Failure case (cold boot, TB5 cable, default loglevel)
-----------------------------------------------------
[  289.341041] thunderbolt 0-1: new device found, vendor=0x1 device=0x8024
[  289.341073] thunderbolt 0-1: Apple Studio Display XDR
[  289.342256] thunderbolt 0000:00:0d.2: 1: failed to enable TMU
[  289.342321] thunderbolt 0000:00:0d.2: 1: USB3 tunnel creation failed
[  289.342383] thunderbolt 0000:00:0d.2: 1:11: DP tunnel activation
failed, aborting
   (x4)
[  289.342748] thunderbolt 0-1: device disconnected
[  289.343325] thunderbolt 0-1: new device found ...      (bounces to 0-3)
[  289.363303] thunderbolt 0000:00:0d.2: 0:10 <-> 3:12 (DP): not
enough bandwidth
[  289.363367] thunderbolt 0000:00:0d.2: 3:12: DP tunnel activation
failed, aborting
   ... at least ~54 s of silence, no retry from the CM ...
[  343.614848] thunderbolt 0-3: device disconnected       (display firmware
[  348.801013] thunderbolt 0-1: new device found ...       resets itself)
   ... this attempt succeeds silently, display lights up
(Note: early timestamps above are journald ingest times - root fs is
encrypted, so initramfs-stage kmsg is re-stamped after unlock.)

xe reports matching "[CONNECTOR:512:DP-1] commit wait timed out" +
intel_dp_link_check WARNs during the failed window.

Observations
------------
1. Every failed attempt ends at tb_tunnel_one_dp() ->
   "DP tunnel activation failed, aborting". Nothing is rescheduled;
   the only recovery path is a fresh hotplug generated by the display
   itself. On a bad day the display doesn't reset and the black screen
   is permanent (needs replug / display power cycle).
2. Hot-plug of the warm display succeeds 100% of the time on both cables
   (40G on the TB5 cable, 5K120 DSC fine).
3. A successful cold boot captured with thunderbolt.dyndbg=+p (USB4 20G
   cable) still shows 2 disconnect/reconnect cycles and one transient
   "not enough bandwidth" for the second DP tunnel before converging -
   success vs failure appears to be the same bounce loop with a lucky
   final iteration, not a different path.
4. thunderbolt.clx=0 makes the "failed to enable TMU" line disappear but
   does not change the user-visible behavior.

Question
--------
Would a bounded retry with backoff in the DP tunnel setup path be an
acceptable direction? I.e. on activation failure / NO_BANDWIDTH in
tb_tunnel_one_dp(), schedule delayed work that re-runs tb_tunnel_dp()
a few times (cancelled on unplug) instead of aborting permanently.
Notably the driver already applies exactly this pattern to
bandwidth-allocation requests that arrive before the tunnel is active
(TB_BW_ALLOC_RETRIES, 50 ms backoff in tb_queue_dp_bandwidth_request());
tunnel establishment just has no equivalent today.
I'm happy to test patches on this hardware, and can provide:
- full dyndbg log of the successful cold boot (3900 lines, on hand)
- dyndbg capture of a failing cold boot (can reproduce)
- anything else that helps (this combination - Panther Lake TB4 host +
  Barlow Ridge based TB5 display - is probably rare right now)

Thanks,
Dennis Wang
