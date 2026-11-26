Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795698108;
	b=kxF1JQhgKThgfotyAkI9VQcKSM5u1spilVY2+g/UHTSqKhe2kEe4o0nVTMHegn5ypnCc
	 XXuc6TgZ9Pq4+1DVyedYSqnHBDlSfeNKt0qfoe9Fp/U5TEvnu/cO2WDLE8LdsGsonykMA
	 tpsYx6n6ThmcHQogULyBflGEb00Cdhy9V6Pcmx7I8gn4xT5qrCDzyc/kMtux+aA0FRVj9
	 R9QuB6GwUuxtZowFx4sWHwBkJKNPdHtJSICCIyPGAgST1OwWOdMrriJePoac1AapTHRrq
	 IZPM3X2335ixplxyjnHo8KnFs6cwDQrSg6WkwLbfrz4mg+42MAb++jT4M6+60Cf87QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795698108;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=vumAHRvKdeApU1jGHdaaLGSo/YHWu29yptpA9z7T8RE=;
	b=1g1WDEd0dSL+bVvldiW0Bp5+s7Id+yk4/kf9e5t4bP/FWOAdsqA/4koeRG42onmgzyXU
	 WrKHAEX7lk84VEUsoFbbUcplUm+AYTSmzuOA5+5NgEDipDJxxmYhtzWFvbKm80EVMSbM8
	 etumtDYoqsHcCqrfIdI+nhnEj+DXTSDTPMyyLi3a2qvAZ3iJPzPi0SoU5zXTat46JEU84
	 oekXInxdQg6CFpk7tc3UYJIGXVIWGfcwhJE+Cn8ZA+d4vyZFiDoewY3kBnWtojWQXtOWU
	 yCL3l5sBsmStW7c40Twx/PNRBNccnLsFQYJS1K3KPNNL44aQHKN7zk6okgyk6mIWZDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SxIO6W5A;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF93606A31E
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 13:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SxIO6W5A
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBA3C1F000C0;
	Thu, 26 Nov 2026 13:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795698107;
	bh=vumAHRvKdeApU1jGHdaaLGSo/YHWu29yptpA9z7T8RE=;
	h=From:Subject:Date:To:Cc;
	b=SxIO6W5AjurIcWu2+xAaJhM7YIkeFKbYe22U6qTtA5Lpou/iaKDAPp8A3RBnmLv61
	 yJcihEGh0zOI9EaMy2wNU7BNkG7JzCTCPH5wgUrc4ATlwEidQUAKwTmiJtyl3jsflL
	 G0MBVEtjSEEmYNxb0bTFkZZdQMfnKZ9axncYSsu/A3eY03XNo32GY/zzXh87Yahu3j
	 gkyz+7g/2t3L6kWvkJShbPhbMGf7WaLw8xfEQA62uMBE1gJJM6x+qIy5gIHq52I9xh
	 wczEplPDjEGF2yRErZaQL132anSaphf79G+7rIoFjVv1VJ6Qx6fdVaLvGPQz/nmEQc
	 qQWT4hpnxJdiQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v2 0/4] DWC3 concurrency fixes
Date: Thu, 26 Nov 2026 14:01:40 +0100
Message-Id: <20261126-topic-usb_dwc3_fixups-v2-0-c0cc2b75c518@oss.qualcomm.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/02NQQ6CMBBFr0K6tsQpAcSV9zCGlHaAGqHYadGEc
 HcLunAzycv//83CCJ1BYudkYQ5nQ8aOEcQhYaqXY4fc6MhMHEUBIAru7WQUD9TU+qWyujXvMBF
 HqABVpvMcBIvbyWFMdu/19mUKzR2V32Rbo3V24L53KP/92c+/uzupO/TbCz4DB65RlUVZNSdoy
 oslSp9BPpQdhjQetq4fBX5lO80AAAA=
X-Change-ID: 20261126-topic-usb_dwc3_fixups-e191ec3d5512
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiazi Liu <jiazi.liu1984@gmail.com>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Felipe Balbi <balbi@kernel.org>
Cc: linux-usb@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, sashiko-bot@kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795698105; l=784;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=BnxKNKjQ75BK45T8wPH6np0+v1EnyBbbi58fOZakoIA=;
 b=h+OgRP/Y+9wwgYWwOxQiK6pik6GVv78wdSGifx6Ix5FnvR3D8QxTykabVPiJlEfFl5C5D70xF
 bO9M5cUigT/CemJayjYutgho5OLRqRkVWOgz3IN85nxppbW+uHTASsT
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

Couple of concurrency fixes found by a clanker. Smoke tested on a
Snapdragon-based Fairphone 5, no obvious regressions.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (4):
      usb: dwc3: gadget: serialize connection bitfield writes
      usb: dwc3: gadget: clear softconnect on stop and failed pullup
      usb: dwc3: gadget: serialize resume against error recovery
      usb: dwc3: gadget: cancel err_recovery_work after usb_del_gadget

 drivers/usb/dwc3/gadget.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)
---
base-commit: 9437046953b2fb3bf55b36582450ea0267df82a7
change-id: 20261126-topic-usb_dwc3_fixups-e191ec3d5512

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

