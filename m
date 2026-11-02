Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793657116;
	b=ZR3PvLtQRzE69RmLEq0BTHpzl1myAIU/jiVYh51a//yIs1FqEdMWOYtkcnlucpFEDTvu
	 tbIiMSPNSv6dMnkCC/EgK6U1YLczvXyf9H0NxLYSnG3Drnq9MO338tk5bWT6oOjMZM9xx
	 RqjTnJ0XSQE2TUdSZh+Wgf6x/kUAC7bo9Gzrv96AdoCvjc7b9EvmJiDLy3MQfdaSGYinY
	 KgliIwM5QOJtyNZuHJfS8yHtoGoztq9Deh4oHJgSh/YcxDbiV+UzTE7HJs6UdHOBIok+l
	 eY8VWOwgdmd3LcXX1YnKZE0W8A+2BtSAkdh6ZdMx8FQ2zMInenwzseiB3KGbhLXs+Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657116;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=po9LaFR4COBNDjXRaH0sos9yo8To8XsMCK5cpaZoeE0=;
	b=gtvG4rNRSBeN0G7H1490y+89FoJDnPFgnBIxk2DVL43Zks6dYyJOuOB8xpt8VXfRM9lO
	 hHuxFFoMReZbQ57mETJ24dCDihK9ZrsMZO5IiHWjdA6nM+CVEZYXRUv5TfoOVqIXURMrc
	 TzeKo3gaUTZMbHViuugqi/O8QJRNq+p/RSxjxPyvD8NbluM0fo3RyzXBWbKaEZyxbN4Pt
	 mT/kqnZuepIui4ZPBFvCq8K1LbF8pTMWya0cnJRDfwbdeQCBZLGkN5McDPyvH2qFImuW1
	 hxv4cHfF1kYIr+dUspa24tNbd1sFSDFSl7awWkCf9foEt9poCT8ntyrGqYKpMMlcqBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JgsAov36;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D135606D816
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 22:05:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D135606D816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JgsAov36
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36a315ed211so122159eec.0
        for <linux-usb@vger.kernel.org>; Mon, 02 Nov 2026 14:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793657114; x=1794261914; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=po9LaFR4COBNDjXRaH0sos9yo8To8XsMCK5cpaZoeE0=;
        b=JgsAov36eHCi4xcxestGz2HdshrJ6ho9n42lUOpL6lQKXpCOfBnFjnryy5u/3Azz2R
         QBtXmKBE3qHG+ej0F5TintEHwkU0I+8of94h0KvhAr7BAoyXbzqsaz3k0dHYzSvxt0mh
         o9A8yJabfYDnFshUU1blgx1XfoBhbZJKvCM2n/P+aj3JfgvU5o8LMzckGXLJRLE8RmOb
         1+prHhFrgG8VBkIw5oi/uib42Kh+n3PbXGiU3YCJX/Oqyel0V0ZDbMGMO+s/L4PS9HIg
         lWFDXvfliB3FFhQThiqrrtnABhPt+I2JzcIfkxI0MRNb4e8X8kTqIoLfG9HDNyaGjXPM
         X3iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793657114; x=1794261914;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=po9LaFR4COBNDjXRaH0sos9yo8To8XsMCK5cpaZoeE0=;
        b=cLCfuxp5ZMuAvkuxLiOBEA23pTYwqJ3KvY3cP8bUhYKnR2J4WdZkUtXUWbtr7yDcbq
         ykUTGRlCMgkFyk6JW1pDoOa+lbk4RzhMWqaQlOxLzCUqsXPjo62QoCtdryWcrM0Bysnb
         S/8EubHhBO4Q/S6w2YCSjSU2RpmG2ZUHMV9SmFs58NmBFCKsGavUTsB2T8WmYlocHt/B
         D6nytaAxEV7sxlZGkql3Nlj56RXniXWv4APLJrpcL3uAq+IBQrB4tTSbhQonCWVqw3S6
         dDIhGnt0YCwnUp2y+1k7UMSmHi5hIZlnvV4S3hxoq385jfkU+Y2pGAjDJt9MjdaZuVzx
         n79Q==
X-Forwarded-Encrypted: i=1; AKwUvBy45Zz+OgyJX9wkoNox2PPz0PGH8jznQp5fHfuUCWZAirEW5ix9DAHgTTOVRL+L137P0eKMDdlvC8g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/jT+k787kkNginRjNff/bJasRB9YxQVWb9b14xWdnn9sCjXCT
	XmPp3PDL4uVw4k0IagzzSO0AX7EAnKL3nYmdmBtEpXgGErtO6L7JAmEe
X-Gm-Gg: AYBFou1fK52NDDDa/LDXYDJgNyNdlR+sNsSfuUsG5AQ0iWHmpt8cYoHkMgl0mYpPh0V
	AL/F2VhLw5xcq72BnguqfsSNcdL7CFtjJrAWqIlf+xXd9lZz1pWk3xdV2OCPKRMgoa35Fl47q/j
	KRNrqrR7utpzPyyhTcIZHMxzjoK1nyhrqVlRllXdB+1PqBQeipdmzjMazZbMWbZZHjGdA3O2BUp
	gGAqcBavInU86n33mgPw0v2PhgNtO/6LPmjD7JZKozRsuiqJlJdXuR1rCKnaNsVzNpiAmy+Upqu
	aDZVmyBHKWN/8PCWr/gpzonuY/8Nyr7qR9Vnr4El8k/LUY/zeRxlLVJm8QM5OH6X/oD4nYlMkxv
	AYHWPYnJ1hlPeaHWpeFbB8eZRi8Mg5Iu7HdnMz98mWLUS3p6Yemx6ul5l2BJil6KyV3KgPkTbAL
	DUOdn4PZr8rYU+qPz523ujUzFlyV/V37cVlrVudvvmJ2EG8tcMbRt41RXk3IQ2zz1rNqZBGc2aS
	+6siA56upqJ5cwlXECnGaw++XcRpdtiJn6xkqKr9zAF4Yx8pHaUpXlKADgGlCUvxJH6SpbbbAF/
	pXm3uKoMS0iy1YyBsdB5L35gyda6URK6gAewUctPcKMioDueTyvD8B93rxIN4/Hbiw==
X-Received: by 2002:a05:7301:4d12:b0:369:dc59:7a6f with SMTP id 5a478bee46e88-36a422042d2mr15983030eec.1.1793657114197;
        Mon, 02 Nov 2026 14:05:14 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4291e38fsm46670346eec.15.2026.11.02.14.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 14:05:11 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Vladyslav Tymoshchuk <tvlad744@gmail.com>
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	abelvesa@kernel.org,
	heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org,
	sre@kernel.org,
	krzk@kernel.org,
	lumag@kernel.org,
	casey.connolly@linaro.org,
	johan@kernel.org,
	jishnu.prakash@oss.qualcomm.com,
	kamal.wadhwa@oss.qualcomm.com,
	daniel@quora.org,
	neil.armstrong@linaro.org,
	kees@kernel.org,
	gustavoars@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/4] soc: qcom: pmic_glink: Hold back notifications over system sleep
Date: Tue,  3 Nov 2026 07:05:09 +0900
Message-ID: <20261102220510.1721-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261022164151.592-1-tvlad744@gmail.com>
References: <20261022164151.592-1-tvlad744@gmail.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I tried the series with suspend-to-idle on a Lenovo Y700 Gen 5
(TB323FU, Kaanapali/SM8850, FSA4480 on the SBU lines). This is v7.3
with out-of-tree board support. v7.3 does not have c7c56b6ec077, and
I left the UCSI connector work on system_wq as well. So only the
series kept the workers off the suspended devices. Without it, this
setup crashed on a DP sink unplugged during suspend, as in [3] of your
cover letter.

- Monitor (pin assignment C) unplugged during suspend, default wakeup
  settings: the UCSI notification woke the system within a second.
  The held-back notifications were passed on right after the tasks
  were thawed. The altmode worker, fsa4480_set() and the UCSI
  connector work ran only then. No I2C errors, no reset.

- The same with ucsi_glink wakeup disabled: no wakeup. The
  notifications waited until the power key and were passed on after
  resume.

- Charger plugged in during suspend, qcom_battmgr wakeup enabled and
  ucsi_glink wakeup disabled: woke up 0.3 s after the plug-in.

Two things I saw on this board, both the same without the series:

- Plug-in of a DP sink during suspend (two runs with the series and
  one without, each after an unplug during suspend in the same boot):
  the firmware sends an altmode notification right away and a DP one
  13 s later. The UCSI connector change only comes 13 s after that,
  so the system wakes up 26 s after the plug-in.

- After an unplug during suspend, the DP controller is resumed before
  the held-back altmode notification is passed on. It tries to train
  the link to the monitor that is gone (about 10 s of timeouts), which
  delays passing on the notifications by as much. It also leaves the
  DP PHY initialised. So on the next resume the USB PHY init times out
  and the dwc3 resume fails with -110. The plug-in runs above ended
  that way, without USB.

A plug-in during suspend after a fresh boot, without the series, does
not hit the PHY problem. It still ends without a display, for another
reason in UCSI; I'll report that separately.

Tested-by: Joonhoe Kim <26rote@gmail.com> # SM8850

Thanks,
Joonhoe Kim
