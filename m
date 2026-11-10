Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794331322;
	b=GedvLWA30UiDMCvhb/bDmTVcDBrBVRnNHr+xveEFLlHhX3bZRrpTJttduZ2Hcn15BK5P
	 9QluoJbJ6vH20O2FtJFanCiuaJ0jhMn2hAmUhy2Cfb3SOqDuxttF5kzwrNg2BvS4hK6lt
	 eYDRBTD5DMHKH3DI2/eLRqh1+8woZZ/zYJXgTZ1vl6xZCI3kPTZTf4xMn2t1tuiJ14Npg
	 5KMmFZGlIjrzHcXNS7vJ1q7EJxGhsJnz5UlsDpxHBYT2lhNWh+DS0a5Cb7A9xbxE6Reh0
	 13SpySDlY2e5O4XVsnv4k0A8qTXjETWqaLtcGC/cf7m3P1USgPKlpqYA/C2VggwXtmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794331322;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=a2lfb+YWF9ky2BY7yTeGdWupjNrafjgwonatQpIRY38=;
	b=syQE5Wul0MPXf9LsAhjmqjjfiRFoaZFGrwbvEfJ0rkMbeP8LJND77kEp8MyjJHxrSmig
	 rLBABv5dgASnm6DBkAuFvXzV9vFPJDqUb1BItdCWPLovLKbyZ03LXbpQHvp37fy+euYvk
	 9Ze8Kz3ftpDQNrc1qlcaVJLq61ECXxe8wCWDtC/AO6Z4kLgwUTUFfEKCoY1Un8+ByQgZL
	 wpKYdN9jTjAlmRcjm5QOr9iLJfQzTf1EBunCzTO04AnT46yuRDOLd4VnBMC9bZRnEdRhK
	 8Go9bh/QEFsvBVWwO3TtBn+QrS+rmBsRkklloXSy1K7K/hXWPz3a6lOhrbOhnanutZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GjolmdHB;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1582460A2625
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 17:22:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1582460A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GjolmdHB
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48dee593f18so1613445f8f.3
        for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 09:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794331320; x=1794936120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a2lfb+YWF9ky2BY7yTeGdWupjNrafjgwonatQpIRY38=;
        b=GjolmdHBr50uXXPHJ1wg8NM0yDKma2Ldu1G/e1NNxN+q5BLXzJ8jmX9QJcnnk9hlgT
         lSbuSJV30ux5W/eLL0TmJ4jule/4FQD3WA3c9OfYj6T8atTZzfz3JPBWrBNf0yICi8CP
         m08xao3OyjLRvTJzrR2QBt2fTz4N0NrbPsh46PQ8qFOufnJvRcLbJXNc8xqHm19ykv3u
         aqUGQRjjHomUPY1ixLytGgKUEuiQiRZtjE0tm81aW/2/dqvwPhUwsajbYHFOv/qDii1j
         80gcbsh9KYpDxi+F9KZgUo64bZ+n6NASiu7QaJUJYgm5M2J34WeA+3zn14udtehSh0JQ
         vz+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794331320; x=1794936120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a2lfb+YWF9ky2BY7yTeGdWupjNrafjgwonatQpIRY38=;
        b=EyVywlLfWMuUbpJFmREjXoSyXRvGyFw6b8O4x0S5umPUccQ0msg6C25FscWXGmwXXl
         hSyWZmR7NTSiWNAEe+TUMorJGwrWR+5Ld5XAdVHI5RL4x/Jf4eAApHwFqWW/X3wUxvd8
         QLgwUM63K9xQjO7P7d3QoIABlZ3ZWN9YwkiLQu5507IFaaRBTh57z+NiMx4gN/iRyaOS
         BhaLwS/dx/E0Cii/LX+qD6/HLRWBoKD5og8PbZYXA+S8vWQHcHFl9LjVa8fWR+BUGFU1
         pJ9GN7V9SqrzCjqIImQOPixc4CeTutikfEClPI+0LEutIGhP4Dn3I2tUlOeZ2zuRmzNy
         BokQ==
X-Forwarded-Encrypted: i=1; AL+hErH6ml0UJLC6t0wWMqE6FhfI7NMCo+PzKkPYQq8a70mrrSy/L/iE03mWMUE5R6W8Io/74fHAB2mo9ts=@vger.kernel.org
X-Gm-Message-State: APuU4Z8R6EgvQSkChOEKCwcvICQNDjBus9kJOYZwsnoqdLoqJXar19WX
	dwKmSWAXGyRBs0D7Ht2jbOkouFxruo5MPJOmLTCNccpPFxfOoGX/Zc8h
X-Gm-Gg: AYBFou1TT1cOySeg8xaPvYePM0tvXdn+uHtCFU4uUj8ottqt6Qe2/SRPCoSeuBK3xRr
	1AXuqN1o+cizSECZGrFznuZStnTwzjbE/yGMID2d+8Caigwf5rjiO11M4d0PNaSusP0ZNdKxmDz
	j9+tk/U/fDDhQ5bxIaiK7x62fbRJtiSzwcn5WioElVK/15d2EGbTv247Vt/DO5gP8JYGkISRtv4
	5hOjTo+3E0qYF3ygyV+KGJ1kmdWZfxGS7VtkE/lGo7OwkmhSBQ4oWQ4F7Itr+00HM3SmjCC4Mrw
	UGqNaql2ggz+y/30y42Jwt08MR2SIxDvDW7X+mY6K+Y2JL9P3P09enIm20mqzhYeIJbXFaBdIaW
	vnE5aAgJRw1DGQqhC5UpmHTyrOLYJ5hhyHCm5OZJ7FPojNeiY4D72+vNtFltGU1djp3mQ36hV+w
	WR3hmIZ3t4GTqilc2ag86wmJZjbnyk196RNstptg4E+/Jae40VAdWVnku4R2OoQ/1C1tHzDsCa4
	XtRcDpi8567jDlOf14Z7sLNINnwPS/q92mjspYrMt4AhEg5+mX6qUFlQAuDKtEAkP4yAB6L9kVe
	8sXTlMJrpOm4yv5Ph0pgWBEq4BatAYgORtuXTp6T4vmHDlSo3Y7ICH4=
X-Received: by 2002:a5d:64e4:0:b0:48c:7387:6b88 with SMTP id ffacd0b85a97d-4982f77f085mr6324632f8f.37.1794331320173;
        Tue, 10 Nov 2026 09:22:00 -0800 (PST)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49836c83432sm5460826f8f.58.2026.11.10.09.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:21:59 -0800 (PST)
From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Vladyslav Tymoshchuk <tvlad744@gmail.com>,
	Prashanth K <prashanth.k@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	Faisal Hassan <faisal.hassan@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: dwc3: qcom: Defer VBUS override update during system suspend
Date: Tue, 10 Nov 2026 19:21:48 +0200
Message-ID: <20261110172148.1640-1-tvlad744@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
In-Reply-To: <auu9hx_Xnjbi3WkB@vbox>
References: <20261022224220.480-1-tvlad744@gmail.com> <auqXyUxc9cRIuYou@vbox> <f9d27fd8-cf33-4e6a-a9fc-6770a933cfb3@oss.qualcomm.com> <auu9hx_Xnjbi3WkB@vbox>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Nov 05, 2026 at 12:02:46AM +0000, Thinh Nguyen wrote:
> Hi Vladyslav,
>
> Could you test this change instead to see if it resolves the issue?

It does. OnePlus Pad 3 (SM8750, UCSI over pmic_glink), v7.3-rc5 plus
board patches, with my dwc3-qcom v2 reverted and nothing else holding
back pmic_glink notifications during suspend. I added debug prints to
dwc3_usb_role_switch_set(), to __dwc3_set_mode() before the glue call,
and to dwc3_qcom_set_role_notifier(), with the device's PM state.

The same kernel without your change resets the SoC when the cable is
unplugged in s2idle. The last lines in the ramoops console:

  PM: suspend-to-idle
  role_switch_set ->0 (pm suspended 1 late 1 noirq 1)
  qcom notifier: role 2->0, vbus override 0 (pm suspended 1 noirq 1)

With your change there was no reset. Each suspend run was 150 s of
s2idle ended by an RTC alarm, with the cable changed by hand during it:

  unplug                  2 runs
  plug in                 1 run
  unplug, plug back in    1 run
  cable left plugged in   1 run

plus unplug and plug in while awake. In the suspend runs every role
switch call came with dwc3 in the noirq phase and only stored the role.
The glue was called once, with the last role, when the freezable
workqueue was thawed:

  PM: suspend-to-idle
  role_switch_set ->0 (pm suspended 1 late 1 noirq 1)
  PM: resume of devices complete after 108.388 msecs
  Restarting tasks: Starting
  drd_work passes role 0 to the glue
  qcom notifier: role 2->0, vbus override 0 (pm suspended 0 noirq 0)
  Restarting tasks: Done

Unplug and plug in during one suspend came down to a single DEVICE
call, which dwc3-qcom skips since its role did not change. After every
resume with the cable in, the NCM gadget was configured again within
5 s. While awake, the glue still gets NONE and DEVICE although the dr
mode stays peripheral, so the call has to stay ahead of the early
returns in __dwc3_set_mode(), where you put it.

Host mode, with a USB stick on the port instead of the cable: plugging
and unplugging the stick while awake works as before, and so did two
suspends with the stick left in. With the stick unplugged in s2idle
(3 runs) the NONE call again came in noirq and was only stored, and
drd_work passed it on after thaw:

  PM: suspend-to-idle
  role_switch_set ->0 (pm suspended 1 late 1 noirq 1)
  PM: resume of devices complete after 2554.135 msecs
  Restarting tasks: Starting
  drd_work passes role 0 to the glue
  qcom notifier: role 1->0, vbus override 1 (pm suspended 0 noirq 0)
  xhci-hcd xhci-hcd.3.auto: remove, state 1
  Restarting tasks: Done

The host-mode suspends were on a kernel that also keeps the USB GDSCs
of gcc-sm8750 in retention. Without that the xHCI came back from
s2idle with an SMMU fault and "HC died" in all three runs I tried,
with the stick unplugged or left in. The dwc3 code was the same in
both kernels, so that is a separate problem. I have no result for
plugging the stick in during s2idle: the port did not detect the stick
every time, also while awake, and I have not found out why yet.

Two comments go stale with this change: dwc3_qcom_set_role_notifier()
says role changes are protected by the usb_role_switch mutex, while now
they are serialized by dwc->mutex in drd_work, and the @pre_set_role
kerneldoc could say that it is called from drd_work, so not during
system sleep.

Will you post it, or would you like me to send it as v3 in place of my
dwc3-qcom patch?

Tested-by: Vladyslav Tymoshchuk <tvlad744@gmail.com> # SM8750
