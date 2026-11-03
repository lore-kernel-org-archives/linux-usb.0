Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.129.46.36
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793740487;
	b=EcKxW06Kfg+plvAcqerDlGL3uLAxyuOtRnUI7XBVxC+m325eS1F3X9hCTMZaEecJ4ynJ
	 ti75bMvJFwuFL6iBEJKJ5fS7jHPVfd3YB5KfT07xIoHDkALJeIdFZQHiq5+cObOAQVsXo
	 DzVMgUxWk5xmmg9APH99q/ZS5/Zyno36y6BGXgV9AzmXBfedqLKXsShT8N3k/Dvj9q67C
	 AaKieCTeTTGNl8maIQWrrC2ZUK2fK182bCAEemu12TUg8BUyBUy7BM3f1m8EM8Go/E5S1
	 JwFosbYq+v94EwDh+IuXzNFFFec8VYupaK7zlaaJvaOPMl8BFxLo/xfwsPW4t0dhlIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793740487;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=NvINaunYYYYFFL4yywoFLrRHKuMRv2otpOsYJV0oMYs=;
	b=AHlEXll0PVgOCnttfmwpH66JETZJNEzoNx6uy0pv/DpmW6oWVj6jNHtOhy8ucHMDbK+l
	 JJR9NcLEfIgyiA3YsW16/vzFibh+MmhBNIeJl9GyDlYLjqNBe6kZKrwnVyGOQ/ghtCEir
	 Oq4L3V5Hmd+fWaQ1RfWt7m/rghqYTx0LfSyqx3Eh5yWjtJcRg+G4QcE9c/T5+zCh1XbZ9
	 vtoVjX3TjM0s7vzgO7PXTg9qF9D55Jkwe9mNgEUGS9yKb7PKR4Z6PmpJVdT3StO+vpZZL
	 W55naGq23W+trCV/d3R4mQqEBBhM9AmhQGjN3ggBgyApkZB/9HTquz4VVA5rjG+j3aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nwlink.com;
	spf=pass smtp.mailfrom=nwlink.com;
	dkim=pass header.d=nwlink.com header.i=@nwlink.com header.a=rsa-sha256 header.s=mail header.b=A0CX73Wr;
	arc=none smtp.remote-ip=52.129.46.36
Received: from smtp2.iinet.com (smtp2.iinet.com [52.129.46.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525BF606D821;
	Tue,  3 Nov 2026 21:14:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 525BF606D821
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nwlink.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nwlink.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nwlink.com header.i=@nwlink.com header.a=rsa-sha256 header.s=mail header.b=A0CX73Wr
Received: from porter.hsd1.wa.comcast.net (c-98-203-133-45.hsd1.wa.comcast.net [98.203.133.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kaf@nwlink.com)
	by smtp2.iinet.com (Postfix) with ESMTPSA id E8673B402B7;
	Tue,  3 Nov 2026 13:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nwlink.com; s=mail;
	t=1793740481; bh=NvINaunYYYYFFL4yywoFLrRHKuMRv2otpOsYJV0oMYs=;
	h=From:To:Cc:Subject:Date:From;
	b=A0CX73WrTbtkS4BW+pf8rshCcZNfEbon26RKLDA+WeHJ3A5TbfgYpFIZiuH8M99hm
	 pUaMEJF7WYGHVvrBVMqDkOzVSoL9nafAwb/Yc2e5+rJRVaYA6J2yY+irE6LKiaNzno
	 Za7YAd1KyfqraTVC6uPx6FalK+OxbyClHBdOK/oyfk/bd6wdf5zLWivsc3YEPu9g+9
	 mBCBDka3w0SrkiKca+YlJqBriszPG11Wo1LEJeDtjXYhu5dUlxoh1GOEaQY6kfyL6a
	 TgLV/J9AgbfR6pkPFPg5BFy9BtLzpGXIdYKjm3gkyBM9+5a7ctDM4wbnlynOawumX8
	 vfnO01uW3mnlg==
From: Kyle Farrell <kaf@nwlink.com>
To: nkapron@google.com,
	gregkh@linuxfoundation.org
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-usb@vger.kernel.org,
	linux-doc@vger.kernel.org,
	flavra@baylibre.com,
	Kyle Farrell <kaf@nwlink.com>
Subject: [PATCH v3 0/3] usb: gadget: f_uac2: allow explicit channel count independent of channel mask
Date: Tue,  3 Nov 2026 13:14:31 -0800
Message-Id: <20261103211434.996135-1-kaf@nwlink.com>
X-Mailer: git-send-email 2.34.1
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

USB Audio Class 2.0 permits up to 255 channels in an audio channel cluster
via bNrChannels. Independently, a channel-location bitmap is specified via
bmChannelConfig for up to 27 predefined spatial locations. Setting
bmChannelConfig to zero indicates that the channels have no predefined
spatial positions.

The current UAC2 gadget driver derives bNrChannels from the number of set
bits in bmChannelConfig. Since bmChannelConfig provides 27 predefined
spatial locations this limits playback and capture streams to 27 channels.

This series allows channel counts up to the UAC2 limit of 255 without
requiring predefined spatial channel locations in bmChannelConfig.
Existing ConfigFS channel-mask configuration continues to work unchanged.
New optional playback and capture count attributes allow the number of
channels to be specified separately from the channel-location bitmap.

The series first corrects bandwidth calculation truncation, then
updates the shared u_audio implementation to accept resolved channel
counts, and finally adds explicit channel-count configuration to UAC2:

Patch 1:
  Widen the bandwidth calculation to 32 bits to prevent truncation
  before the calculated packet size is checked against the endpoint
  maximum.

Patch 2:
  Pass resolved playback and capture channel counts explicitly into
  the UAC1/UAC2 shared u_audio implementation instead of deriving them
  from channel masks.

Patch 3:
  Add ConfigFS playback/capture channel counts to the UAC2 function
  driver and use them when generating descriptors and stream
  configuration, allowing counts beyond the 27 predefined channel
  locations.

Runtime dependency:
  A separately submitted fix for u_audio_iso_complete() prevents an
  additional residue frame from exceeding the endpoint's maxpacket
  size. With allowed channel counts increasing by ~10x this existing
  issue becomes more readily exposed. The fix is not included in this
  series and was submitted previously.
  Link: https://lore.kernel.org/linux-usb/20261026231026.721536-1-kaf@nwlink.com/


Testing
Testing was performed using a Raspberry Pi Zero 2 W running the
rpi-6.18.y kernel with this patch series applied. Streaming and
descriptor validation were performed against both Linux and macOS
hosts. Windows hosts were not tested.

UAC1
  - Verified playback/capture operation via alsaloop.
  - No descriptor or behavioral changes observed.

UAC2
  - Verified legacy channel-mask configuration (up to 27 channels).
  - Verified explicit channel-count mode with 2, 28, 61, 62, 96 channels.
  - Verified invalid channel-count/channel-mask combinations are rejected.
  - Verified Feature Unit descriptor size limits at 61/62 channel boundary.
  - Verified descriptors including:
      * bNrChannels
      * bmChannelConfig
      * Feature Unit presence and bLength
      * AudioControl wTotalLength
      * endpoint wMaxPacketSize
  - Verified ALSA-reported playback and capture channel counts.
  - Verified streaming using alsaloop.

Changes in v3:
  - Widen bandwidth calculation to 32-bit.
  - Remove now-unused channel mask fields from uac_params.
  - Document dependency on the separately submitted residue frame
    packet size fix (u_audio_iso_complete()).
  - Remove Assisted-by: LLM attribution
  - Link to v2: https://lore.kernel.org/linux-usb/20261016162534.384844-1-kaf@nwlink.com/

Changes in v2:
  - Edit commit messages for clarity and brevity.
  - Add Assisted-by: LLM attribution.
  - No code changes.
  - Link to v1: https://lore.kernel.org/linux-usb/20260729054115.889174-1-kaf@nwlink.com/

Kyle Farrell (3):
  usb: gadget: f_uac2: avoid truncating calculated bandwidth
  usb: gadget: u_audio: pass channel counts explicitly
  usb: gadget: f_uac2: allow explicit channel count independent of
    channel mask

 .../ABI/testing/configfs-usb-gadget-uac2      | 18 +++-
 Documentation/usb/gadget-testing.rst          | 18 +++-
 drivers/usb/gadget/function/f_uac1.c          |  4 +-
 drivers/usb/gadget/function/f_uac2.c          | 84 +++++++++++++------
 drivers/usb/gadget/function/u_audio.c         | 32 ++++---
 drivers/usb/gadget/function/u_audio.h         |  4 +-
 drivers/usb/gadget/function/u_uac2.h          |  4 +
 7 files changed, 113 insertions(+), 51 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
prerequisite-patch-id: 252c6902eb4bd4f6456cd86e4c123e8001e70a11
-- 
2.34.1

