Received: from mail-m49217.qiye.163.com (mail-m49217.qiye.163.com [45.254.49.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902E439A7EA;
	Sun, 10 May 2026 14:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778422156; cv=none; b=YuJDWlWUU3B/rTtS3peSWOAP31eaaDFGwy27rlZdlEdsloBusnM/7hlFnabXB2rgqYMHCwigDTMLuJOICIZdipcgDbwvvqS6vQbg59l88puyXLCRLDzQa9WhAGCTxKRdwkVQ0tklSEFttExL/r6dx8KCu5zQeu3lNfx7SR9JOPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778422156; c=relaxed/simple;
	bh=qNuRmWjOvodj7BP8pJ2VufzZygVsCAcwy3il7jg+T0w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pCri7aoJSKm8RlwRUpGwrc8tl4gc2moYGLSy4nnJL9R1Pm0Z1kEVLaKR4xFcTLOqiowkfZDDwnje95MGn09RSPoCsRPXVSynIwd6rb5vjAOtEOOjneIE+zZMW2JXcFOW4vcD9gcd8AGDICxlYHO2tnApKb0/9t5haMatWN30YfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=Lpr8NCIq; arc=none smtp.client-ip=45.254.49.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="Lpr8NCIq"
Received: from server001 (unknown [222.130.22.242])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3dd2c6ffb;
	Sun, 10 May 2026 21:53:44 +0800 (GMT+08:00)
From: Kefan Bai <baikefan@leap-io-kernel.com>
To: linux-usb@vger.kernel.org,
	si.yanteng@linux.dev
Cc: gregkh@linuxfoundation.org,
	seakeel@gmail.com,
	alexs@kernel.org,
	dzm91@hust.edu.cn,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	doubled@leap-io-kernel.com
Subject: [PATCH v6 0/8] Add Chinese translation for USB subsystem
Date: Sun, 10 May 2026 21:53:31 +0800
Message-ID: <cover.1778415392.git.baikefan@leap-io-kernel.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e122a52be09d5kunm9f76e21d35e08a
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaSEpDVklMH0IeSRhJSUpCQ1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUlVSkhLVUlJVUlPSVlXWRYaDxIVHRRZQVlLVUtVS1
	VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=Lpr8NCIq0LwUbv68WDoGjUIdKETwhWG2A++fnBmc1lRFLabDEYf4QKnyChnIQOfOicy7HgF5XXhwyLP6URx1ZD7Dblmn5g+IIBcCnLnE3utAfgTjZkk8eVytU3EFm2iXTd2xRkaI6KvOQRbllbohsITZ3mPZ0j6U1+7Ku1FsRgxlDlcT8wXUtlklFMtFru2Xue9nq5cmtOTKEzAR61FUBrZm9M6zCx7bMhpXRaIsi1PUMzCDWfSSdmvQgqaSSMxI7YYSYQHkrItlrWTLKf+HoakoqDDlDQshGjLjwC5izgDkbkY3bD4BTAFKwAVDH8QUUNS1o+jpjEjd1915VkM44w==; s=default; c=relaxed/relaxed; d=leap-io-kernel.com; v=1;
	bh=QrUkLz8puRF2l1LILFAIK2/bc5QOQhGC50RIGswL+7o=;
	h=date:mime-version:subject:message-id:from;

This patch set adds Chinese translations for the USB documentation.

Apologies for the long delay in revisiting this series. I have now
  rebased it onto the latest docs-next tree, rechecked and polished the
  translations, retested it, and resent it.

Changes in v6:
  - Rebased the series onto the latest docs-next branch in Jon's tree
    (git://git.lwn.net/linux.git), as suggested by Alex Shi.
  - Added the USB maintainers to the Cc list.
  - Rechecked and polished the Chinese translations throughout the series.

Changes in v5:
  - Moved the index.rst entries for acm, authorization, chipidea, dwc3,
    ehci, and usbmon into the corresponding patches so the series builds
    cleanly when applied patch by patch.
  - Removed extra spaces in chipidea.rst.
  - Sent the series to linux-usb@vger.kernel.org for review by
    Chinese-speaking developers, as suggested by Alex Shi and Yanteng Si.
  - Link to v5: https://lore.kernel.org/linux-usb/cover.1765180570.git.baikefan@leap-io-kernel.com/

Changes in v4:
  - Shortened overlong title underline and overline markers.
  - Removed the CREDITS entry from index.rst.
  - Link to v4: https://lore.kernel.org/all/cover.1764674650.git.baikefan@leap-io-kernel.com/

Changes in v3:
  - Updated my sign-off to use my full legal name, as requested by
    Jonathan Corbet.
  - Reviewed and fixed the RST syntax issues noted by Alex Shi.
  - Kept the number of translated files to eight to make submission and
    review more manageable.
  - Link to v3: https://lore.kernel.org/all/cover.1763984424.git.baikefan@leap-io-kernel.com/

Changes in v2:
  - Updated [PATCH 01/25] docs/zh_CN: Add index.rst translation to include
    the corresponding changes to
    Documentation/translations/zh_CN/subsystem-apis.rst.
  - Link to v2: https://lore.kernel.org/all/cover.1763897036.git.baikefan@leap-io-kernel.com/

v1:
  - Link: https://lore.kernel.org/all/20251123074540.34161-1-baikefan@leap-io-kernel.com/

Kefan Bai (8):
  docs/zh_CN: Add index.rst translation
  docs/zh_CN: Add acm.rst translation
  docs/zh_CN: Add authorization.rst translation
  docs/zh_CN: Add chipidea.rst translation
  docs/zh_CN: Add dwc3.rst translation
  docs/zh_CN: Add ehci.rst translation
  docs/zh_CN: Add usbmon.rst translation
  docs/zh_CN: Add CREDITS translation

 .../translations/zh_CN/subsystem-apis.rst     |   2 +-
 Documentation/translations/zh_CN/usb/CREDITS  | 162 ++++++++
 Documentation/translations/zh_CN/usb/acm.rst  | 136 +++++++
 .../translations/zh_CN/usb/authorization.rst  | 132 ++++++
 .../translations/zh_CN/usb/chipidea.rst       | 142 +++++++
 Documentation/translations/zh_CN/usb/dwc3.rst |  60 +++
 Documentation/translations/zh_CN/usb/ehci.rst | 230 +++++++++++
 .../translations/zh_CN/usb/index.rst          |  54 +++
 .../translations/zh_CN/usb/usbmon.rst         | 384 ++++++++++++++++++
 9 files changed, 1301 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/usb/CREDITS
 create mode 100644 Documentation/translations/zh_CN/usb/acm.rst
 create mode 100644 Documentation/translations/zh_CN/usb/authorization.rst
 create mode 100644 Documentation/translations/zh_CN/usb/chipidea.rst
 create mode 100644 Documentation/translations/zh_CN/usb/dwc3.rst
 create mode 100644 Documentation/translations/zh_CN/usb/ehci.rst
 create mode 100644 Documentation/translations/zh_CN/usb/index.rst
 create mode 100644 Documentation/translations/zh_CN/usb/usbmon.rst

--
2.54.0

