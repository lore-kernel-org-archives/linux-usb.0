Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC9F3E2AB7
	for <linux-usb@vger.kernel.org>; Wed,  5 Aug 2026 07:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785915397; cv=pass; b=JNv4oxmqUdPPqdIS+e/6eKeaJwjjr/9wLhMe8+NGIZjzQ6MM6+01v8Ut7+KaCeqylooRkIPXai1UyAymYJdPpn+U8xAZKqyR+px4A7kSBszo+IMXluVw9/TKX4oShiIGc6cKfyHD4ltKJRnj1exQZFubKIS+cDEBcX/WFL1LbfU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785915397; c=relaxed/simple;
	bh=xGxnVi3lGoEFuEahJsDINJmDX+RfQNxu1kDekNa8Aqk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CTmrV/VS18FYgSSnJtEzlz012PXoCU+Yc/RL55qUOizdXHDlH4fP+2ebVJAn571TiDBAj9LJKDnQPU9XYTDI+vstJOZZCaclrLaviVS0hdJPZKDUzlmV1aJUEhyAb1Dx0qpfjZBrAlPi/bmn8KSFfy+YKB45aucu+i5Pid4NbYY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=behler.me; spf=pass smtp.mailfrom=behler.me; dkim=pass (2048-bit key) header.d=behler.me header.i=@behler.me header.b=mVHNl23n; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=behler.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=behler.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=behler.me header.i=@behler.me header.b="mVHNl23n"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-664a09bc459so981576d50.1
        for <linux-usb@vger.kernel.org>; Wed, 05 Aug 2026 00:36:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785915394; cv=none;
        d=google.com; s=arc-20260327;
        b=gVrxe18wLCozx1Qb9eP1c66IAO8lgWXUTvv739umSVn/Po/uC4ungpVO9whAdBoIrP
         BcwLRO+crkNhIFyiYPzVBI8ZOjOQstG8Jpxy7+QafuKlLX8ntNhIJMIDKTbX8nzv6HDE
         YcBChXs7SaCeEgQ+joz9pJjV8yCvUwVc+RIyrO4Hljar4OFgiSoPf9+wV9PoLmfihZSq
         hWT1cPgaH+LFkoJI9z9Oxd+8qU1rtr2HdU+RRPeqkuBQPt1z+xFofaA/duApAbedcgGO
         EhCvu5PSOnVJRC7B0VQA+LqyMGIvieXo0RziSc+ad0LpgrfhCJgH9SrLnTLj+lLLsBZ2
         pA3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pwm+LlowPY9vPcB+T9axyMQcBGk7e5jWR5riOc7h0to=;
        fh=fPXnWPsi3f7SCSp9saiMQBwVeohT1G4AielRK1qiPnE=;
        b=Ejqxxi0r6wKQZ00jrf/R7ac58QGWn8wdYPXp3jUK0cwPZPnWKJqH5QqCSpzT4tmcX9
         hK5/fmh5lovVnJEk1cPZzo/NbBT7WnNnof8LpfDMlywQMMspyRVuIxCl7Cq6flbTi/Y4
         K6w0TJmu4gM/CpP0Zg55Z9MOgRqddJAnZBmzhvVoia05Fx1fCTLE/B+BEFlHgp8qZIx/
         IlY5Q9s4ZJ+oX/6vHLYNksG1k9putifaZ6gPYDIVVvo3qXShKnh66mk/CiGi9nndCs9L
         q/ZFBGMs5YjVKsjwZ77kbtDhLinyQbHj8+psJAurQ+DQKn5E6YezEIOuMi23s4wX2u85
         csdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=behler.me; s=google; t=1785915394; x=1786520194; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pwm+LlowPY9vPcB+T9axyMQcBGk7e5jWR5riOc7h0to=;
        b=mVHNl23n7P1xiwCM0LkT37yzW5eUALmcym89j6ZUPXcU+kK9OqoFsvdcD60rtxO70m
         9nhquul/ZL0o+nPLZI7x2I0I5H+J9J+L0en0fYNzk3T1jjAojK+uoXYVAtqrXm5iF7Fc
         QmMBX73NBwcqMtsWj6/KWg0ZJVJp3KZGicZv0r8EK+dOT1dcYnsCOXs0r1s1zjd80Gme
         3w/YNFUk1HXhdEspgvC00mI2gTjEHx4BBQLyZZ7wa1GMJOCo0JmeJkc1V9jeIBVluys/
         HLVK+YE+n8CH2mvyTHN3LSiGO2nMhgyFoeZiXCeY9eTlxvmTN4Jj8hRDcrXUQVW1V674
         93Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785915394; x=1786520194;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pwm+LlowPY9vPcB+T9axyMQcBGk7e5jWR5riOc7h0to=;
        b=hE+DFshDlqOyt4EYpV1lBEwCdwIYoTREPV4iFkf6o9yF/LR03LkxriF9V3Bo0wKOYv
         CmHNMxiTfgLKSjUpOpd91vhx+42Uow1FMZxIUsY9xoQqqNaMpTbJgcQnuRTbwigqUTKA
         sBJ9NFJybRCeDnPTWayUBUO1BQVhReJtGvuPX7DEYaF8Kz1ItVnrHB6SOLqZlDhU51D4
         YqchpmY03NoRQ2SlE/cqdnPa/ZgB/BJr8iSX34wOwU7fUFlifR8BQm5nEZd+VqYadD/B
         1P3HfK97C+R9sfWzLwpYRL+UFH5DJZQxdXFmibrnz6q2BNNk5k1ZOov0gGWWTxXKdCgR
         m/hQ==
X-Gm-Message-State: AOJu0YxSySktMD3Dwyl57fjBUVQMihx83qLKffcDUs+5RZWOHQoNx5Qc
	AR+hiIeOHs79RHjr2ezkPUXFUyewy2PzVSmVLV9ohCHWNfbfTxP6D8fWprAOmUYSo4acaL0d90N
	wUpygIXpQnJBmC8cpHdIonp+vDd5XEdrDyUnnaHF+Nw==
X-Gm-Gg: AR+sD13pYadPItJ8kCqej1bmvIl+MYgWyzWzdWatJjHqkxC9Uq06lUPzQzJTH+lDJAp
	gzgQ5HQRx8MDBqtKOKoSpYJacxPPLUHLrJr142g9ApCUZQ7eO7wqfPyfmDvqHUbXjKqmRC0MU6N
	2zDNpHWZH9nW4xHozA2c3I4Z/PLQXI4qKLJ3WzIONqXWj8JTQ3Jn9tlcSgM0+dQMD+DF4SMGIiT
	jkeGwTs435GpAjUr5ftGnoBie3Q/YG9aWAM3efrYpMBlOQK9zLzRVgcmI7dOMKfI211KjSZOAx3
	kNntLTQqwq6OajzgjGdcIfWcCcZSsjE8djl088+bUYygXNXqi2BDmve60l4=
X-Received: by 2002:a05:690e:10:b0:668:4ef3:ac41 with SMTP id
 956f58d0204a3-6699aa3787emr2141994d50.31.1785915394368; Wed, 05 Aug 2026
 00:36:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAM=hwCxiJwODObeut=JcCA8jbu4C-XVEKJpR-y2MnDJibBQyOw@mail.gmail.com>
 <20260802064729.GL20844@black.igk.intel.com> <CAM=hwCytVxuqfT2d4UNaf2x5FCOpMXaaGyuQ6xEoh_+w8NVJtw@mail.gmail.com>
 <20260804140449.GA235112@black.igk.intel.com> <CAM=hwCx7hg7ZubxmGOND02Do_Vp7W-qJRXK+NyN48sO0Zmy0_g@mail.gmail.com>
 <20260805041421.GE235112@black.igk.intel.com>
In-Reply-To: <20260805041421.GE235112@black.igk.intel.com>
From: Bernd Behler <bernd@behler.me>
Date: Wed, 5 Aug 2026 09:36:22 +0200
X-Gm-Features: AUfX_mzBxRe2jIp5uB-0VBqqwxGej1PY2-VEIr7YO7ViUQVX4XXmw03AJuBUgzI
Message-ID: <CAM=hwCwB=eXrDKFLdohPhvPMHCGm_+2qukTa5qiDknkyFVcj=g@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_Apple_Studio_Display_=282026=2C_Thunderbolt_5=29_=E2=80=94_D?=
	=?UTF-8?Q?P_tunnel_torn_down_every_few_minutes_on_Intel_TB4_host?=
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Imre Deak <imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mika,

> This is not expected. What typically happens is that there is another
> hotplug and the DP tunnels get re-established.

You are right and my observation was wrong =E2=80=94 I had queried tbtunnel=
s after
the re-establishment, not during the outage. It goes exactly as you describ=
e,
about a second later:

  16:47:48  acking hot unplug event on 1:11
  16:47:48  1:11: DP OUT resource unavailable: adapter unplug
  16:47:48  0:5 <-> 1:11 (DP): deactivating
  16:47:48  acking hot unplug event on 1:12
  16:47:48  1:12: DP OUT resource unavailable: adapter unplug
  16:47:48  0:6 <-> 1:12 (DP): deactivating
  16:47:48  looking for DP IN <-> DP OUT pairs:
  16:47:48  0:5: no suitable DP OUT adapter available, not tunneling
  16:47:48  0:6: no suitable DP OUT adapter available, not tunneling
  16:47:49  1:11: DP OUT resource available after hotplug
  16:47:49  available bandwidth for new DP tunnel 34650/34650 Mb/s
  16:47:49  0:5 <-> 1:11 (DP): activating
  16:47:49  0:5 <-> 1:11 (DP): DP IN maximum supported bandwidth 8100
Mb/s x4 =3D 25920 Mb/s
  16:47:49  activating Video path from 0:5 to 1:11
  16:47:49  Video path activation complete
  16:47:50  1:12: DP OUT resource available after hotplug

So: unplug on both adapters, teardown, then a fresh hotplug on both and ful=
l
re-establishment roughly one second later. Nothing stale. Sorry for the noi=
se.


Cable and power supply
----------------------

> Also, you connect the monitor with a real TB cable, right?
> The second idea that comes to mind is power supply

Both original Apple parts, and I can answer this better than by description=
,
because of how the desk is arranged: the NUC sits physically on top of a Ma=
c
mini M2 Pro. Same room, same mains outlet, same monitor, same cable.

  cable plugged into the Mac mini underneath  ->  stable
  same cable plugged into the NUC above       ->  teardowns within minutes

Nothing moves except which host the plug goes into. That rules out the cabl=
e,
the monitor's power supply, and anything environmental. Note the Mac mini M=
2
Pro is Thunderbolt 4 as well, not 5, so this is not a TB5-sink-on-TB4-host
problem either.

The cable was additionally swapped for the 2022 unit's Thunderbolt cable
earlier; link still came up at generation 4 and the failure was unchanged.


> Based on your dump it also happens to both DP OUT adapters (11, 12) at th=
e
> same time.

Confirmed, always both, in the same millisecond bracket. The tunnelled USB3
and PCIe stay up throughout =E2=80=94 only DP goes down. The monitor's USB =
hub,
webcam and speakers never disconnect during an event.


Usage pattern
-------------

> You don't see any "usage" pattern there when this happens?

Partly. Scrolling bright web pages full screen raises the rate noticeably a=
nd
is my usual way to provoke it. But it also happens with the machine idle an=
d
nobody in the room, at a lower rate. So load correlates but is not required=
.

I am sorry to say I cannot run any more tests: the monitor goes back
today, so this
hardware is gone as of this afternoon and no further tests are possible on =
it.

What I do still have is everything captured while it was here =E2=80=94 the=
 traces
already sent, matching dmesg with drm.debug=3D0x104 plus thunderbolt dyndbg=
,
and full journals across several sessions. If any of that is worth a closer
look, or if you want a specific window extracted, just ask and I will dig i=
t
out.


Bernd
