Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794768821;
	b=gLMFdbwLP1HW75d1tP3UxUuPprJIxz6UGTMXeAEggR1pSkQ+Wqi8W8YCQ16Muor05WT7
	 mMPqUb9WaGU3WlQk+qyV81L6h/u1L+lKK9vmcBLRt+AUkHdHCu8s1lMjwO/O8DBDLqtKw
	 iPN+9xrw5oHXhHYud7tZ75POtL49GJrABW5JghkcZ6qdZWVgmAI2bqmdBK+kwUUn9fduc
	 CtqYK6yW3YC0THIRcHfYKYpBtKKfQA0vjjIBzUhuGYj45lpRfvDEJn5aMqPb+v4wHk2mZ
	 ft/1NcMxfk3xDyTArO88XCt2kAPY3VTYal9J85ZUuyAsE9ien1u09ajc9AVyEg28DTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794768821;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kgBPwDDX0CwJQQOHPTuz21QVSBDvEn3NadhaVZDEiYM=;
	b=O7bX6n+tdHf0iJFYhbKyUOKvhEWUuSvh8FHo4cNSlgagzL2A2GDSJbV4I+OzXaJdWL99
	 kZC9MyU+eWbL/IKSTbF9KfBxiIUVRCqQzOrj2g4N+xNUnYz5Df5tT7yORvUWuVlwhlH5r
	 hDv4IEwUx1cdHH/BaofR+muQw1MrFbKYVacEoidvIOw1flS41FKqw63RXM5Bj79mWaWtb
	 TzKE6Y4Filp9028INvGKeIor2uV7qW3xXmJ6lK34tsMkQM/DdqouV+0ocZ2azceMVBtk+
	 g6S8fJiPOT0nb0JaLJjN5Leoz0LceVs06KS/c6hvUpQ1yjjth31LGnkjoxy7SANE7LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yuzi.co;
	spf=pass smtp.mailfrom=yuzifovich.name;
	dkim=pass header.d=yuzi.co header.i=@yuzi.co header.a=rsa-sha256 header.s=google header.b=cuSfOPL9;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A888606A31A
	for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 18:53:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A888606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yuzi.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yuzifovich.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yuzi.co header.i=@yuzi.co header.a=rsa-sha256 header.s=google header.b=cuSfOPL9
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so14711915e9.1
        for <linux-usb@vger.kernel.org>; Sun, 15 Nov 2026 10:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=yuzi.co; s=google; t=1794768819; x=1795373619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kgBPwDDX0CwJQQOHPTuz21QVSBDvEn3NadhaVZDEiYM=;
        b=cuSfOPL9SxtWJBIQCPRkCUVbjmCBC3S4+VTz+bTqgxvRZhgftPlGpK2uiuwvIjogDQ
         CYGi0qIXqJ13VzjJc5XxVsflKsZI7NzypaDFx8hpEwczBtUxebgzAXG9bMyVONf/Pbtt
         fSt9qTLUWmQvq0iCQ23655ig0PSIsYtrfeqYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794768819; x=1795373619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kgBPwDDX0CwJQQOHPTuz21QVSBDvEn3NadhaVZDEiYM=;
        b=XLQAiO93aclU+NVrlVzcNdQNxrBf1KBlsxVtezO6bUrDTkyKMK9XQM6oqf4hO4gNWb
         31KRcRkqBa16RFVBkqDkDKdgeMBtJr/uUMSGvX8JyurXZL5KaofjU2xKGtoG2ZlMSw2d
         izJ4JrKMiYbNaFNx7ULm0VfNTW/CVXkW8e+yspbl3Oasy4EVXOqALWy8bfZo+qLj6aTJ
         LaTCxXjn+s33sCTtGxUo+8C0zMuDzAatyH1YtWCow1qmtG3CGZhWvlHmql7sccMJpDDi
         H+xaVkngngCZDRw29aEyzH5kVZf0/a/jQ4CuRI8B50zh+bMt41pn93NLsCS99ts2Ym54
         Va4g==
X-Forwarded-Encrypted: i=1; AL+hErEFA9XFwAW/szRiBFI+dhxVE2HrSZBqvQV0FOcedM5ldIx/I5rqfE6e+yzntdJVvnO5LluGAYPt35o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nzDk5mFpRGXG5SmOEJkSOwYG/cF2G7Ef/fpOTwNG6Gjkv5nJi
	srjNLEfSBxtHLBrv6eyXH2qFlypISqI45/OSlVHnKT+GZiw1iu6H1Yhvgcm1dBa0k4Y=
X-Gm-Gg: AYBFou237MvNPuWKeOc4L0v/W1XyPlc4NcioSvjo+tPWEoscCU4XPwuKZWKA+93XYu+
	Tjw52GZh6gFy6MyNxJAUEo5q5Hk3Y6wDtAstQ5F8+N8nIARGzY3MaBB8lvuvySDOIAGNO/fpYZb
	hKpFqSFmfITYEiWMh2cB526q3ZOzcD5HvwI0YNcjkaRqfGIP6cLFTVxDIZYD4iaxuIYj137tucM
	d5hE2k5n1Ogk8C2DuzhZdHugI2DTE65hcpemsUFHT3AKjHTYjeFY8o1pxoFXcvIz40Hp5NBdArT
	Cgf1ZFV4hkY8c4L61hJ/o8qrhYBlmYxMsE7ZJflZSXKsNnbGTpbATgDe85eKTz2XyLCv9qjfpFj
	mVfIxqeK06ovVF16nWGFBPwQCeceeg0WLcK6+5x1yDmV8ojANHzlqkpkbuBslhJZP56/1l0nQcL
	ocG2ykdf7oqzMqBIJvIoxLtPdNX93cbSwL1AzfT5LpjCR6F6KryRKwAPdA3AmKg7xshFK/bIAVg
	9130ijmOJyiDyJ5n3NPg6Z6Q/r6D77TzBOu8MW0otAgNCXW6+1oqRuWaERuYtvSJRGD7du0Fj5v
	BO+PZWQequ5gi8WwMFlqQicja9MB35kwCpC11BZZKe1KvJ1CArDLk2kTLgm8/WrUr8i4plF2Z1H
	0VrDynqdAkD519m6TyUFUQFUS7h4ANMk/vvbk/MnEf+ukSJMzbGcr1mbDbay5G+Kgt97PyzwKJj
	K6+FjjK/qq22HabA==
X-Received: by 2002:a05:600c:3ba1:b0:4bb:6847:792d with SMTP id 5b1f17b1804b1-4bb68477c2dmr82470275e9.20.1794768819503;
        Sun, 15 Nov 2026 10:53:39 -0800 (PST)
Received: from terra.lan ([78.83.170.221])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2538b9sm508419145e9.1.2026.11.15.10.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 10:53:38 -0800 (PST)
From: Vadim Yuzifovich <vadim@yuzi.co>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Chen-Yu Yeh <chenyou910331@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-usb@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] usb: dwc2: gadget: descriptor DMA fixes for BNA, found on Sophgo SG2002
Date: Sun, 15 Nov 2026 20:53:32 +0200
Message-ID: <20261115185335.782678-1-vadim@yuzi.co>
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
and the BNA interrupt then repeats until the host resets the port.

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

Known limit of patch 2: it starts the current request again from its
beginning, which is right when nothing was transferred. That holds for a
chain of one descriptor, the only case we hit. A BNA in the middle of a
scatter-gather chain was not exercised.

Testing. The series as posted here, applied to 7.3, ran on the SG2002
under the load described in patch 3: 1.47 million TEST UNIT READY in
8 minutes (about 3060 a second) with a 1080p60 H.264 encode running, no
BNA and no port reset. The viewer's network link dropped several times,
so the encode ran for about three quarters of that time. An earlier
form of the patches, which our tree carries, saw no BNA in 6.2 million
transfer starts and none in a 60 minute run at 1080p60, where there were
about 6200 a minute before. In that form patch 2 also waited for the
core's write-back of the descriptor at XferCompl and changed the AHBErr
message; both are dropped here, the wait because it never triggered.
On 7.4-rc1 the series is build tested only (x86_64, W=1 clean for
gadget.c) and passes checkpatch --strict.

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

[1] https://lore.kernel.org/r/CAH_=YdDCDyFBn2k18w8Ck5jrmHHZme7TuAA71hSgcAa9ZPb38Q@mail.gmail.com

Vadim Yuzifovich (3):
  usb: dwc2: gadget: restart descriptor DMA isochronous OUT endpoints
    after BNA
  usb: dwc2: gadget: restart descriptor DMA bulk and interrupt endpoints
    after BNA
  usb: dwc2: gadget: make descriptors visible before the endpoint is
    enabled

 drivers/usb/dwc2/gadget.c | 112 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0

