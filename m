Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.119
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792484046;
	b=3FHn/fgPWHDX8o0Cp0tY7u8Qk7oG5fOV4/l2ckWe3pvioupNe73Frvm+PSoIGkBh+uyr
	 l/ZUtbNQPYVtjzalyk0WPCejydQh9kD0Vr7oQHi/WoSs0ELNBVAswLKAQ56ITMe2ra29l
	 AK1DSU+wFgN3hWuihG3dkN7ze2lS/KV+9MNo1uhUhPTFBd6ltqsWsZxICTJiTbGAEyqeW
	 ikH+70AD8M3swejkIeUyYmO6l7Y4w5lNCXtbvQMJDT+Tuub2d9pUgUOyNxp82d2NqH3bO
	 cVwvwC1gUWYS3o+d/iotfv5ljM4k83CozJerOqJ9G0wvnFI+LDV6z9GW6NQ9Jk6ZW4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484046;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=X4bINhtKBaaElpvArj+vZ2TGO7bG1iKJJOaA7N4cXl0=;
	b=b/MYRo9WDIM3CcaiQHgdSCgNbjZKin7PTuJV9MsYXK849sSpW0PykD3jzn/vMEbWW7W2
	 3Cs+13oqxYoqsq3opwb8eNaBI3wRGsMyqy8Ze219MN0yqYrQ5tVbB4bGyRidMsLNp81VI
	 KIQDkQASWyjHdjxs0h8StHfWDc/vwJILHacNJ/6UeZHzFzEMYPth6PUS/nh25F/TM6JDk
	 MS1ebjcwvK3fdRACijajdewKuTs7aNEduISSZwDad9iaUd/HnE452inuRfVVAUiMhgVjU
	 +j9T3SJUhpSHZP2ExnIl3wMSexUorDHO7IpOXYXzvXy45m57dKwNXkDmyELccB9npEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=pciucoBX;
	arc=none smtp.remote-ip=95.215.58.119
Received: from mta1.migadu.com (out-119.mta1.migadu.com [95.215.58.119])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43812606A31B
	for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2026 08:13:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43812606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=pciucoBX
X-Envelope-To: linux-usb@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=t+xbYwZwz/irX9ML7U6cwCqnY9N37pIe4TbNWL6A6gc=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792484037; v=1; x=1793088837;
 b=pciucoBXuAbjTJk/b+bPPUdE9Qskblprf+3oEcW068O0+zLHUs/JZdBPqOaN8mjj4+d/XOfV
 RWPd701+QN5/MAVYEV79e//gt+gssNMv3YmU8IFrU4PpDLaaL7Yck/Ewo9UO0DOeP2dIBBFo7hP
 2XCBHgQmN6N/o8Fy6fYHNlwlE2DXrKhnrz+/WceeDRMt2MuGbjYm5qANwPHm9A5l480jFeVBdqs
 4yywm+uCqYXx5f1Ixlh3+esDPOP/YSSilHPN0Zj/Z+f2Dh/76jnjFDr9qTvslAj42uSqXICD3IU
 N8yX84rEcO86amNbisz46V5BfSKcp47j2hDVWT/0/e0DA==
X-Envelope-To: linux-usb@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 56071984f75ef8a4;
	Tue, 20 Oct 2026 08:13:56 +0000
X-Mizu-Trace-ID: 56071984f75ef8a4
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: 
Cc: Val Packett <val@packett.cool>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/2] usb: typec: fsa4480: Support reporting hotplug events to a codec
Date: Tue, 20 Oct 2026 05:12:52 -0300
Message-ID: <20261020081343.1507986-1-val@packett.cool>
X-Mailer: git-send-email 2.55.0
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

Currently the fsa4480 USB-C SBU MUX is not actually used with audio
codecs in mainline. I have gotten it to work with the wcd937x codec
on sm7325-motorola-dubai (copying the Type-C notification handler
code from wcd939x to wcd937x, will be sent after this).

v2:
  * Rephrase dt-binding commit/desc to be about hw connections (Krzysztof)
  * Remove usb-switch-ports.yaml, inherit port instead of port-base
    for port@1, require port@0 inside of ports (sashiko-bot)
  * Put the codec/codec_switch references in fsa4480_remove (sashiko-bot)
    (also I thought about this myself but assumed they were managed when
     successfully attached.. but no, looks like they are not)
v1: https://lore.kernel.org/all/20261018225906.1265299-1-val@packett.cool/

Thanks,
~val

---

Luca Weiss (1):
  usb: typec: fsa4480: Report switch & mux events to codec

Val Packett (1):
  dt-bindings: usb: fsa4480: Add an optional audio port/endpoint

 .../devicetree/bindings/usb/fcs,fsa4480.yaml  | 99 +++++++++++++------
 drivers/usb/typec/mux/fsa4480.c               | 57 +++++++++--
 2 files changed, 118 insertions(+), 38 deletions(-)

-- 
2.55.0

