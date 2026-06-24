Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BBE38239C
	for <linux-usb@vger.kernel.org>; Wed, 24 Jun 2026 19:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782329375; cv=none; b=g7YdmveF7shIPwzkw0unWJX1Cwp9ZHyyxpT/FayARE01nODsXjqY0d4pmDCDcOor4p61f/EjBFekgaU0jYTyww/QsFNxA645sK/+cw5unQK3G7FiO8ADdJwEmjWpI5KKFFXNUg5CkLh8e8MFYOarxibgi2S9lEX2ITJSzlu7ZAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782329375; c=relaxed/simple;
	bh=t4mXeQQzSfEO5bS6iVqLDj3M9FECyJRZ/OxLtlR0yl8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ttlbKvosPn5rvQf2CMeqEgWI8dpYPgjnYVLwKgVktQeRu/dQxKsz8WinSh0bkv31s3Nsh992DmIVhAfp+SG5kLZ4qG6VCEdZ7vLKrC8lk8PbFAIAxi1ipYR3zGNvFzifzXCOr9Bo4O6hjxCWuKJNvEKZyDevlMpp/rKnp0THUKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=JIBhN8Ww; arc=none smtp.client-ip=121.127.44.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="JIBhN8Ww"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-e1b5cab7be; t=1782329372;
 bh=HB+X1zwClEyuS34sjRMolD4Gdv13rlFePfJPWzCgmg4=;
 b=JIBhN8WwwnfK05u4UInYQTFbXLx5h5Og8Co7l5qqnPfsENAh44VU4qM8vvq6xN7OZLmZBULWn
 h6arrQYmvroITRrySjPGgCcdOgq8mAXHqXKKEdiuhA7jriEMpD8zZbYrNMlqM3Ca4h4cEu0PnLb
 0LcAqW0evkuMjmX2pnadky7I+4cKuqqKAAniQmQwurEDc64x27mUatrnZhNs8ngCbiYio3p3P60
 W1hr9vRGJKI7jno43iVvojRNVeERKYREmeh5pwlkCpQbDPzZmngWfAQdLC/X+ywsvHDjMAxLsqr
 WISU0aOiAY9fLRY4gz0qOmMQrusKe3ePjd0f4R4D6/Qw==
X-Forward-Email-ID: 6a3c2fa3138f49c481104aa0
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.8.32
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Diederik de Haas <diederik@cknow-tech.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v2 0/2] rockchip: Fix devices suspend freeze on RK3568/RK3566
Date: Wed, 24 Jun 2026 19:27:23 +0000
Message-ID: <20260624192726.781864-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes a system freeze during suspend in ohci_suspend() due
to clk_usbphy1_480m not being enabled when EHCI/OHCI registers are
accessed on e.g. a Raxa ROCK 3C board.

Following pm_test modes work on my ROCK 3C with the missing usbphy clk
refs added:

  echo N > /sys/module/printk/parameters/console_suspend

  echo devices > /sys/power/pm_test
  echo platform > /sys/power/pm_test
  echo processors > /sys/power/pm_test
  echo core > /sys/power/pm_test

  echo mem > /sys/power/state

Changes in v2:
- Include rockchip,rk3588-ehci in the EHCI constraint
- Make clocks prop required for EHCI and OHCI
- Collect t-b tag

Jonas Karlman (2):
  dt-bindings: usb: Add Rockchip RK3568 compatible for EHCI and OHCI
  arm64: dts: rockchip: Fix devices suspend freeze on RK3568/RK3566

 .../devicetree/bindings/usb/generic-ehci.yaml    | 14 ++++++++++++++
 .../devicetree/bindings/usb/generic-ohci.yaml    |  7 ++++++-
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi    | 16 ++++++++--------
 3 files changed, 28 insertions(+), 9 deletions(-)

-- 
2.54.0

