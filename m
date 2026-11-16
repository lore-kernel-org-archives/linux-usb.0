Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794812684;
	b=SLcjhIBNVFwK8jOJ3wyMOMDhaC/xgVJTTpw+AMarBveQUsvgivr3zoIr2aXKLtOoQ6op
	 te0CEADtuCcMO46BKtI1vxIuOhwoUgnUhZMh/0tdw/3R1c7UsbKchb1BUNIc6cU4IPG6n
	 BczqWnP5Vt863HxAOsiLAx/rhv74lJdZs2xfrMZAmOJM0QbNp4TtvyynImaiQ8YgwRQS0
	 A+Wewlwb5qWLBqDK89Ye39flnqZ4Wkx/pThvf1q7wcmYkmdmBYm6IzHKPwmnuU//c0cxW
	 cUSMrfrPdbsX8fdBg/kC4CaYsM26Q3xYqEFiiOpjU648ldgL72eCyzX8OqZaUq4OmBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794812684;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pt09097h9ysJS5ZfIzXTT0rIndByGyUmSEStSnFTz5c=;
	b=CrIV/0c634FrGTNaMP5qUQqx13O46mGYSZc43bvpse5fke1bu0bJDze4zQDGjOXhWR8v
	 bOjWNGGhM+pZ2+ePWZ8qwBzv/C4SHxnYNc6j2QvhsApIiuZF03b3bozlg0NPg/XjnKajG
	 v/yilrZ7wUOLzt7sWv+iNZ9ohIu227QH30yZmo/Y0eCaigDhbkQzXmNOnR69eh1YlTygw
	 wp0L31Rfh2kybFwmz/By6Dvf+NJPadQ9uYiZFEM8lEITjWyrmZvB4t1gTw+7bJSznxZK4
	 e5kJLKjLfx6dWEV4S7r+DFHjL5BFgCMI+1jy4Y3TNGPoYO8cKYB5X8pl9RSt0TeARvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yuzi.co;
	spf=pass smtp.mailfrom=yuzifovich.name;
	dkim=pass header.d=yuzi.co header.i=@yuzi.co header.a=rsa-sha256 header.s=google header.b=FGXKe0jB;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF965606A32F
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 07:04:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF965606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yuzi.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yuzifovich.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=yuzi.co header.i=@yuzi.co header.a=rsa-sha256 header.s=google header.b=FGXKe0jB
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c50a4a2132cso371247966b.3
        for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 23:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=yuzi.co; s=google; t=1794812682; x=1795417482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pt09097h9ysJS5ZfIzXTT0rIndByGyUmSEStSnFTz5c=;
        b=FGXKe0jBS5U0RE2A/2it51RHvwmwdNa9aYkNx/+QOZQOFQb1GzEaFPyJzPP7qX5Zsb
         rs/myO+RHIgXsrTIxH23B8/picsnE1s4vyPXzh574m3tpt4h3puoF8RL5g9sRTsZwMqM
         r66BU8N16rBFd8CELMxlbS79GT6mmIQFcaWms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794812682; x=1795417482;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pt09097h9ysJS5ZfIzXTT0rIndByGyUmSEStSnFTz5c=;
        b=RrQy5EETEX3Izt3LkNSJQ67DR3JhVmpoiyhw+N8Q1ha33wYO3Dtl0tLkbhuMUbvhWt
         X63jUwQo6JPQ2JQi0V+SvbdjSchOaW3rJFMi9chHQPgMJHHlC+EtlYmV7+7Urn3NVHOY
         hF6pp/8oPuzco4YMFIB1XJneMIJAE1+RmxrZ6ZhoHE4pbB0bIFPKPqM/zfvPPQ3i3x78
         Q6ZBK4PJ1puBmL5KsE4zpJ/PUlHPIQnIVS+JHnfI7j9PV9N/FRdgdHBx0G8j/oGQChM7
         dU0NdvWlzo/rYLA2UnUS9ndmToV/D0CxvoT+CMSdI6AfTSlWFHl0f2VWFohQA2BEaYTu
         fQzg==
X-Forwarded-Encrypted: i=1; AL+hErHD2zYzy57C2Xd7+T/MKPZ6gx771mshUHVUTA+8z2bugOySscb51zG6NQInFlbIyPb7qmxvKv7KEKc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+QieH0/N5+jsHBiHb4p5FX+wRL5jurYPResRjXzlrQMlvb5qOC
	2hw7bEZx7OcZPBMNFeGgJ9arDO/KrSxs8AQAIjPYyMahEMv2gNGOxOszmNAYXIYpu4E=
X-Gm-Gg: AYBFou1/0d+kmkQRPNmweOUluqDRXHFRY4E1VAh6kqZmqGr/yzNON0EVv65ls99Jp/K
	So89KdVZcEZHjidJ0u1qFURhTXXiRBO9cJGnEWHUe4gLZyVa/pC00NqHaK40OUbP43IBu+bBB5N
	teKx3zwLeD9ukRYlAJnUD4JCOamzMLb7eaR42jtSlNB+Tiu+OZe0zrnJIN/GqdqsVkr6HYq//g0
	RTM0etyCaKNW1ftdid2fGkMtbdLLjBNRCg4Wy4o48Q11sIwB7JneO46PFdmu8UdFpTXabCH802n
	YhQLl/zy9E/FZqA/dX0Xsd55CxswxmhGDPaMoLj/fSh4o1xNZsKZVVL3OVD+KQRBtKjSMhccRu0
	/orLTxmA6sCtpG+VeNhhjM9GZGISBsp7cvdGJaGrdnvxMksFbvoDgl7ML0PsyP5lmyyd4RD5710
	dnAzAXY87qKZ25NgtHWioY9Hcp3yP51afbgevBpgH9O4SBU7oGWUhbeF25pWzg+31Va8IgRMnQY
	OvnLVmAjsrfqwQtj7K7mPxaw0VFRLDKwmRwxQjQll7BDw5j+P0VVRpz3UMgXrT0QM+pUqw/n1Sg
	RFvrMWzYoFnmNiK6LcqdeeYoQjJ8N5lGvz0gHGduLTazIijRMuktc2dYpmYkyO4VRrsircuyJlh
	Z5i7nQ4lvkl7CSqHuxWs1FvgC05aloVqrMyX6GYEiMNn0/gSAqcZOdmrbDpvJUCcnNlD1yWngrE
	aMZLl7MF+C+QHcSw==
X-Received: by 2002:a17:907:d406:b0:c45:b99:f282 with SMTP id a640c23a62f3a-c509611660emr716058566b.7.1794812681935;
        Sun, 15 Nov 2026 23:04:41 -0800 (PST)
Received: from terra.lan ([78.83.170.221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c6451sm21866706f8f.45.2026.11.15.23.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:04:41 -0800 (PST)
From: Vadim Yuzifovich <vadim@yuzi.co>
To: gregkh@linuxfoundation.org,
	Thinh.Nguyen@synopsys.com
Cc: chenyou910331@gmail.com,
	inochiama@gmail.com,
	linux-usb@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vadim Yuzifovich <vadim@yuzi.co>
Subject: [PATCH v2 0/3] usb: dwc2: gadget: descriptor DMA fixes for BNA, found on Sophgo SG2002
Date: Mon, 16 Nov 2026 09:04:30 +0200
Message-ID: <20261116070433.2813951-1-vadim@yuzi.co>
X-Mailer: git-send-email 2.56.0
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

These are the three patches offered in [1]. Chen-Yu asked for them as a
series and offered to test on a Milk-V Duo 256M.

We run a Sophgo SG2002 (T-Head C906, DWC_otg 4.20a) as a peripheral with
g_dma and g_dma_desc both on, as a composite gadget: mass storage, HID,
ACM and UAC1. Descriptor DMA works there, but only with these changes.

Patch 1: an isochronous OUT endpoint that takes a BNA is never restarted,
and the BNA interrupt then repeats until the host resets the port. The
v1 patch was wrong, as I wrote in [3]; this one is rewritten.

Patch 2: a bulk or interrupt endpoint that takes a BNA is only logged at
debug level. It stays disabled with its request current, and the
function waits until the host times out.

Patch 3: why bulk endpoints took BNAs at all on this SoC. The core
fetches the descriptor before the CPU's stores to it have reached DRAM,
although writel() orders them before the enable. Reading the last
descriptor back between two full barriers closes the window. The
measurements are in the patch.

Patches 1 and 2 look generic to dwc2 descriptor DMA. Patch 3 is the one
I am least sure where to put. The effect was seen on the C906 only, and
the read-back costs one uncached load per transfer on every platform. If
it should sit behind a quirk or a core parameter, or belongs in the
RISC-V T-Head errata code instead of dwc2, I will redo it that way.

Patch 2 starts the current request again from what has been transferred
of it. We only hit the BNA on a chain of one descriptor with nothing
transferred. A BNA on a later part of a long request, or in the middle
of a scatter-gather chain, was not exercised.

Testing, on the SG2002 with the series applied to 7.3 plus counters and
a hook that holds interrupts off for a given time.

Patches 2 and 3, under the load described in patch 3 (TEST UNIT READY
as fast as the host can, a 1080p60 H.264 encode running): with the
read-back of patch 3 switched off, 368000 commands in 120 s (3070 a
second) with 13103 BNAs, 12809 of them restarted by patch 2, and no
port reset; the other 294 were on the bulk OUT endpoint, came together
with XferCompl and found no request current. Two more such runs: one
the same, one with a port reset whose cause I did not capture. With the
read-back on, 546000 commands in 180 s, no BNA and no reset. In all
runs the endpoint was disabled when the BNA was handled, and no
endpoint-disabled interrupt came for a bulk or interrupt endpoint.

Patch 1. A tone is played into the UAC1 gadget, eight requests of 1 ms
are queued, and interrupts are held off for 3 to 40 ms every 1.6 s.
v1 does restart the endpoint, but then takes one BNA and one restart
for every packet, about 2000 interrupts a second, until the stream is
closed; the audio is mostly intact, which is why I did not see it
before. The reason is in the changelog: the core keeps the packet that
met the BNA and writes it to the first descriptor that becomes ready,
before the endpoint is enabled.

With that packet handled, the endpoint still stalled about once in 100
restarts, 5 times in some 900 holds of 9 ms: every isochronous OUT
packet dropped with OUTTKNEPDIS, bulk OUT NAKed, GINTSTS.RXFLVL stuck,
then a port reset by the host and no answer on EP0. In the traces an
OUT token had arrived while the BNA handler ran, and the handler
flushes the Rx FIFO. With the flush removed, on the same kernel, 1360
holds gave no stall.

This series as posted, plus counters: 480 holds of 9 ms, 480 BNAs
handled, 480 restarts, the stream never stopped. 400 holds of 3 to
40 ms: 361 restarts, none for 3 to 7 ms, one for 9 and 12 ms, two for
20 and 40 ms. 90 holds of 8 to 40 ms with the TEST UNIT READY load on
the mass storage function at the same time: 108 restarts, 608000
commands in 150 s, no BNA on a bulk endpoint, no port reset.

Not tested: isochronous IN, full speed, an interval above 1, and a
stream that the function stops feeding.

To try it on a CV18XX/SG200X board, gadget DMA has to be allowed, since
dwc2_set_cv1800_params() turns it off:

  --- a/drivers/usb/dwc2/params.c
  +++ b/drivers/usb/dwc2/params.c
  @@ static void dwc2_set_cv1800_params(struct dwc2_hsotg *hsotg)
   	p->host_dma = false;
  -	p->g_dma = false;
   	p->speed = DWC2_SPEED_PARAM_HIGH;

and "usb: dwc2: Disable gadget descriptor DMA for Sophgo CV18XX/SG200X"
must not be applied. That change is not part of this series. Whether
DMA should become the default on these SoCs is a separate question, and
host DMA was not tested.

An AI coding assistant (Claude) was used in the debugging sessions and
in drafting the code and the changelogs. The measurements were made on
real hardware, and I have reviewed the patches.

Changes in v2. The first three are from the Sashiko review of v1 [2],
the rest from the test above:
- Patch 1: handle BNA before the endpoint-disabled, OUT token and NAK
  interrupts in dwc2_hsotg_epint(), and ignore a BNA for an OUT endpoint
  that is enabled. Fixes tag added.
- Patch 2: restart the request from req.actual instead of from its
  beginning.
- Patch 3: read the last descriptor back also when the isochronous
  chain is full and next_desc has wrapped to 0.
- Patch 1: the chain start keeps descriptor 0 host busy until the chain
  is written and the chain address is set, and deals with a packet the
  core holds from before the BNA.
- Patch 3: read descriptor 0 of an isochronous chain back as well, now
  that it is marked host ready last.
- Patch 1: the BNA handler no longer flushes the Rx FIFO.

Raised in the review and not changed:
- Patch 1, queue empty at the BNA: the endpoint stays disabled until
  the function queues again. On this core BNA repeats while the endpoint
  is disabled, and the next one restarts it.
- Patch 2, BNA handled before the core has cleared EPENA, or
  endpoint-disabled latched after the restart: in about 40000 BNAs on
  bulk endpoints the endpoint was always disabled already, and no
  endpoint-disabled interrupt followed. I do not know what the core
  guarantees. Thinh, if the restart should wait for the
  endpoint-disabled interrupt, I will do it that way.

Thinh, patch 1 is built on what I saw this core do, not on what it is
specified to do: it holds the packet that met the BNA and delivers it
to the first ready descriptor while the endpoint reads as disabled, and
it does not survive a Rx FIFO flush with OUT traffic going on. If the
databook describes the recovery differently, please say so.

[1] https://lore.kernel.org/r/CAH_=YdDCDyFBn2k18w8Ck5jrmHHZme7TuAA71hSgcAa9ZPb38Q@mail.gmail.com
[2] https://lore.kernel.org/r/20261115185335.782678-1-vadim@yuzi.co
[3] my reply to [PATCH 1/3] in [2]

Vadim Yuzifovich (3):
  usb: dwc2: gadget: restart descriptor DMA isochronous OUT endpoints
    after BNA
  usb: dwc2: gadget: restart descriptor DMA bulk and interrupt endpoints
    after BNA
  usb: dwc2: gadget: make descriptors visible before the endpoint is
    enabled

 drivers/usb/dwc2/gadget.c | 249 +++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 234 insertions(+), 15 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0

