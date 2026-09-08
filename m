Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD602EC57C
	for <linux-usb@vger.kernel.org>; Tue,  8 Sep 2026 14:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788878603; cv=none; b=qtX1om67Vb2XmP3Md89bFb/7xNXJpQYcbSC+wGjhMhR0sZ3c6wo3CoiGT1avbgJmP12NcyCfjFnDxRY+u0/mCUYALD94yGS1093QuZ9T2aoHqRnoRzipPEf6FOwOXoP/KuvxixcHQKh/7WSk0A08Qw8yAuYIfw+NwpJLCza9UGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788878603; c=relaxed/simple;
	bh=Cizh/rafKYNYT0KXLdcIIm+Lz+4kUEHHuvKUEJoYFmU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jqc9722idEeJtJCpCX0hNviH7HK8+M5dfJ3TzZsKjuNIeeGT4/eZ1msMVaT5mcV8C/+HqoXDfx1IDe89dZhK3D/k0F88NCDgkTz6r8OTTEyapuaIckgWdRYhcYncHVZulhhv0LLopyDZDAwcO+j6KsMvt5IKd7d56Yy32LWuzcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C2tUO9Y9; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C2tUO9Y9"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-499db1740e4so2255625e9.0
        for <linux-usb@vger.kernel.org>; Tue, 08 Sep 2026 07:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788878591; x=1789483391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KDuIAOmD9TOy7wbeKmvOrBhyXGkPda+5cVc0xJOwDR0=;
        b=C2tUO9Y96jzEt1GHtbZboXZUPxkVeqLJsx4gJwZe//1omS3R8bjCaifgpFF+Tmy5UV
         l7OSFsHmkdTtN8y74oEJNm1Z3UgPn4x8osLilL+F6Ht4FLmXPREDRc5woA2jhP2PQfVF
         /jiGv7rq0aT6IvUkjEkvBtFjKRSRQ4goaVW7xBSIbcE/fQvZOoQn6UPL1ISzkNO+fcM+
         s4sGvFQfAAH6hItxMsZz0ZU7uI3EfExP30Y/RZvI4WaSOXM1o88oxatp53FWzFFxBmaf
         zAqmFm1J805amQSRm3dP5FGfjfBEOoOtXAhK1eHO+CN0h+b1OSLO4oSS8H6PAqI0uqHF
         mOVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788878591; x=1789483391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KDuIAOmD9TOy7wbeKmvOrBhyXGkPda+5cVc0xJOwDR0=;
        b=d822iCHKpkSmr/rh9hLKBHYL66esZpHPzJofEof0hwGsARNwLXT/RvYuw74A3bdtFN
         MfaEVhwxkqmdrtv9EB7YSVe8ySFIralXEVlS6xcAgtzdV9AO6HEPyWRE/erXSK+gqq7J
         fD2iBRpSEqiFT6tEzZEJocijxErYLebH1nGAn8iqzF1EGjoxwb09P3Mqc1AF8AUaz/bS
         gl89JK36LbXbeAnFHPoPv7Axy8qgh1Fxfz32sGZpRCACR3MFT1jjy95tScJaACfR+w8y
         WbP+MroXk45guqnXTkP5GQTr1TfS6MZa33TEbu8WLZLoVChte+V1NXdERJXjoY3roeog
         v+kA==
X-Forwarded-Encrypted: i=1; AKwUvBzZnfv6PJaBSzwT8qcDStzgZ33+xkzdmgrk3caR8Zf5o94dU+0K8xAhULZay5MCh9LfI382QOJ7w/4=@vger.kernel.org
X-Gm-Message-State: AFuF++l9d3V/n1zrrHwhvTichL7B85zoftObVQm09Yb+9PQbqxqHnBOG
	/n+y5Z3VCRglaq81FLtJXLkrP6MxCg85yoRMiHu/i+1dt+8eLfjJpVS7
X-Gm-Gg: AYBFou2k1bubrlyno6hLxM4LPgjVh1QynxGXqKg02ezscOqTveIPAQ01IfB9aqwlkJL
	RQsnXoGP5fB1oKkeslwGWQn8zCrTchUwhA8ZqXK0Ng4mIStaokH4Xc0pGnkKdVSHhx/u8Aw9DhW
	X7Me/+FIXVPuyzV44cRxiGeQnHn6+Hiugd0LuqsUX2zIBTu74wZ7XSJijWJVUF8ntbkRgfNJ82+
	wuqpekL8T43ALXKeMV9urlhFH8gO6996RYaqyptccI0LVh/4S3odkrKgW5Nm+nzrP2SjKSEvN14
	7lYm8AxVexe/dWWy57W2ZsDfWRLrFe6ANZPDtEIjobvy10G4T30yY1/2rqEEocCDLkH7pvaRhZB
	wfxXywASAyujMekY09pIsJYuqEttEzSf6/HAuko+EfsGlTtBgVeMlBUFUw/hImHi5d6Q2ARxYBy
	anpfAEiREndDqrtbtiYdRcAYlOnMpVAo1TaNlbrabwTOYnHLTUHv3vUggcwSYGChtm8vWRsIsG0
	I5/7wV5e0uiGYtGeb9wJI1Lh+IaEJaCrtK0vf5yCQQeur+EDtoTKXarZUUIvRmD7dypow==
X-Received: by 2002:a05:600c:4f48:b0:49d:798:67a4 with SMTP id 5b1f17b1804b1-49d079867f5mr193440325e9.0.1788878590675;
        Tue, 08 Sep 2026 07:43:10 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B825D00A0B3828666A65C4F.dsl.pool.telekom.hu. [2001:4c4e:1b82:5d00:a0b3:8286:66a6:5c4f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee7fec25sm564356455e9.13.2026.09.08.07.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 07:43:10 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vinod Koul <vkoul@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: s2idle resume hangs in ohci/ehci on RK3588: HC registers touched before the USB2 PHY is powered back on
Date: Tue,  8 Sep 2026 16:42:44 +0200
Message-ID: <20260908144245.10700-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908133147.8291-1-royalnet026@gmail.com>
References: <20260907190000.s2idle-usb2-resume-royalnet026@gmail.com> <ap__5zeUakMSLWOQ@venus> <20260908133147.8291-1-royalnet026@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Sebastian,

I tested 53014abc on the Orange Pi 5 Plus and it fixes the hang here.

Setup: same kernel (7.3.0-rc1 based), same dts, same procedure as the
report, all four USB 2.0 hosts bound, RTC alarm as the wakeup source.
The only change is that commit in phy-rockchip-inno-usb2.

Result: 4 full s2idle cycles, all of them resumed. The controller that
used to hang, fc840000 (the OHCI on u2phy2, the port with nothing
plugged in whose 480 MHz clock had it as its only user), went from
"enters ohci_platform_resume and never returns" to:

  ohci-platform fc840000.usb: PM: ohci_platform_resume returned 0 after 20649 usecs
  ohci-platform fc840000.usb: PM: ohci_platform_resume returned 0 after 20773 usecs
  ...

8 out of 8 resume passes in that boot returned 0 (4 real s2idle cycles
plus the pm_test device/platform phases), each around 20.7 ms, and the
same for fc8c0000. For comparison, before the patch the all-bound
configuration hung every single time and needed a cold reset, while the
control with the four hosts unbound completed 4 out of 4.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus (RK3588)

Two things about how the module was built, so the tag is not read as
more than it is. The kernel was built with aarch64-linux-gnu-gcc 13.3.0
and I built the module with gcc 15.2.0 on the board itself, against the
installed linux-headers package (that package is arm64, so its host
tools cannot run on my x86 build machine). vermagic and the modversions
CRCs match, and as a control I first rebuilt the unmodified file from
the same commit and got exactly the srcversion of the stock module, so
the difference in the tested module comes from your patch and nothing
else. The module is also unsigned, since the headers package has no
private key, so the kernel is tainted O and E.

Two log entries I do not think are related, mentioned so you know I read
the whole log rather than only the part I was looking for. On one resume
there is an rcu_preempt stall report, but RCU marks the CPUs
"(false positive?)", the NMI is answered, and the backtraces show them in
cpuidle_enter_s2idle, i.e. asleep where they should be - the opposite of
the original failure, where the CPUs did not answer the NMI at all. And
on one of the three resumes there is a WARNING in
drm_crtc_wait_one_vblank ("vblank wait timed out on crtc 0"). It is
display side, and it happened on one resume only rather than on all of
them; one of the monitors on this board goes into its own power saving
after a while, which would leave the CRTC with no vblank to wait for
while keeping HPD asserted, so nothing about it appears in the log. I
cannot prove that from the log either way, but it is not the USB path.

Also, the network check right after resume fails for about a second
before r8169 reports "Link is Up - 2.5Gbps/Full"; that is my script
asking too early, not a regression.

Happy to re-run this on the version you post this week, and to test the
PCIe suspend series on this board as well if that is useful - it has
NVMe, two r8169 NICs and an rtw89 card on PCIe.

Igor
