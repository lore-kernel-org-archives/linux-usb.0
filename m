Received: from forward501a.mail.yandex.net (forward501a.mail.yandex.net [178.154.239.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDF13AAF6D
	for <linux-usb@vger.kernel.org>; Mon, 24 Aug 2026 08:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787560204; cv=none; b=cdnq9FhM+q7+v+C6TfuCcIFxluALWEJQwYLWbFGs2KlPBx+DcMRaANvjIluOPrj2+dRvtDVAs8NPemsLftaNc5v/JdiLMaQavWyBMCF1VYZE2zJa2VomF3WWc2kc/WzS/q5X+LNkRlMKrQabUUWqwGs6rqWyMlI+Z5jYXsGUT+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787560204; c=relaxed/simple;
	bh=YzCeYW5wGgsSfg1XFcDEA7l2yzdyVq9KRD4SUP5iqd4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CbselWmqsFXZAHi+lb9rSJEU1R7nE7+dcukwLAfW8XfcODRl9vOxUgCBvYcEguAnOmXQHLc7wwgKsQQep1P8/3tEuf5WZ08z34nt0Mb1Elih73hM8PKMqLW1uMkP7MF3JyrxkvIfagjIL+Nsy9CmB1C50M6qbOVcLCNAxAzYQdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=OhPMjhkb; arc=none smtp.client-ip=178.154.239.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="OhPMjhkb"
Received: from mail-nwsmtp-smtp-production-main-54.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-54.vla.yp-c.yandex.net [IPv6:2a02:6b8:c17:2010:0:640:2180:0])
	by forward501a.mail.yandex.net (postfix) with ESMTPS id 7234980E9C;
	Mon, 24 Aug 2026 11:29:43 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-54.vla.yp-c.yandex.net (smtp) with ESMTPSA id fTWs3DpgMqM0-uL0iamAW;
	Mon, 24 Aug 2026 11:29:42 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1787560183; bh=4hyxVpdZQli3F4oM/stWjj50QF2eDCzSOEjZW6bvM3I=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=OhPMjhkbcNti211C1c8i9IZVBDSgZ66Hbij53F7tuhsdGT9Y1krVHm6dsnS018tZi
	 fJeptmg///Xu5vXTmDpOqgDcgO580Th2NNlCfAX6AYnLRafrP2O7cNPdJVb3sT2FCY
	 l3wENQW1NE3ggrd4+kAZxGnzrPxyOzkvzrpRdSWk=
Authentication-Results: mail-nwsmtp-smtp-production-main-54.vla.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Mikhail Zubenko <misha.zubenko.01@yandex.ru>
To: linux-usb@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v2] usb: gadget: dummy_hcd: add tick_us module parameter
 for timer-rate tuning
Date: Mon, 24 Aug 2026 08:29:41 -0000
Message-ID: <178756018156.117640.10342065043164224700@yandex.ru>
In-Reply-To: <178750530003.146199.10916428504166445366@yandex.ru>
References: <178750530003.146199.10916428504166445366@yandex.ru>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hello Alan, Greg,

thank you for the review =E2=80=94 all comments are addressed in v2 below.

On the mbox headers in v1's body: leftover from the prepared patch
file, my fault for not stripping them; v2 is sent with a fixed flow.

Point by point:

- "not a pendulum / the rate depends on traffic": reworded.  The
  timer rearms while any URBs are queued; against a permanently
  polled HID interrupt endpoint the queue never drains, hence the
  fixed ~8 kHz in that scenario.  "Pendulum" is gone.

- "dummy-hcd does not use any xHCI controllers": clarified =E2=80=94 the
  Bluetooth session lives on the machine's real xHCI controller;
  the co-existence is at the platform level, not inside dummy_hcd.

- tick_us is now a member of dummy_hcd_module_parameters
  (module_param_cb with a setter that rejects values < 125).

- Speed-aware default: 125 us for high/super-speed emulation,
  1000 us for full-speed (where the natural unit is the 1-ms frame).

- MODULE_PARM_DESC reworded to "Length in microseconds of an
  emulated microframe" per your suggestion.

- Kept absolute microseconds rather than a percentage: with an
  absolute value the real interval is directly readable from the
  parameter (1000 =3D 1 ms), which was easier to reason about when
  bisecting the platform hang.  Happy to switch to a percentage
  if you prefer it.

- The delay is pre-computed once per controller into a ktime_t
  (timer_interval) at setup (with an explicit (u64) cast on the
  tick_us * NSEC_PER_USEC product =E2=80=94 32-bit platforms would otherwise
  overflow it); the DUMMY_TIMER_INT_NSECS macro is removed entirely.  Consequ=
ently the parameter is 0444 (load-time
  only): a runtime write would update mod_data.tick_us without
  affecting live controllers, which would silently mislead.

- The per-frame vs per-microframe "total" budget computation in
  dummy_timer() is indeed wrong for a lengthened microframe =E2=80=94 I'll
  follow up with a second patch fixing the bandwidth model once
  this one settles.


Best regards,
Mikhail Zubenko
