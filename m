Received: from mail-m49216.qiye.163.com (mail-m49216.qiye.163.com [45.254.49.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223E61DB13A;
	Mon, 24 Aug 2026 10:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787568086; cv=none; b=BCb5mhtlGdaMY3aI/LUHrmxW6cHIOssNkWwAUf3pUB5lg0e1GDM3ScuLZh0gcaHu/ZTWx5UJBMQOXJ+DpZZvttjTLmrgclB1GOrWB2G/o04x5BQc1ANm5Y0TM3Y549N9erMCkj0Bm10aZB/Bz/KeX7CxbmLwjtCP7TUcZKxHMWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787568086; c=relaxed/simple;
	bh=FaLhgn4w4szLce8wdTMS4BFSCsqBZgp+3ZcjBk7Bfc4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jBQg4va56Mc17ya9/f/n8Tfcbvn5NcqabAoBbCiJlAFdzd7dsM5G+4crN++FuZdjHTqR6pF7Yu7hX8VSTo7ccNIQLijwdc54wnlZV/HWCX3ep4sgCwo17xyKxHu2cW8ouln+n7qv1+XAa7PDeds0wBWNQT3MLQ5rFH5rYGK9prw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=V/2Scb4a; arc=none smtp.client-ip=45.254.49.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="V/2Scb4a"
Received: from ROG.. (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4b18d9733;
	Mon, 24 Aug 2026 18:35:59 +0800 (GMT+08:00)
From: Meng Li <meng.li_g@thundersoft.com>
To: hongyang.zhao@163.com
Cc: broonie@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org,
	heikki.krogerus@linux.intel.com,
	krzk+dt@kernel.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	robh@kernel.org,
	rosh@debian.org,
	Meng Li <meng.li_g@thundersoft.com>
Subject: Re: [PATCH 2/3] usb: typec: Add Hynetek HUSB320 Type-C controller driver
Date: Mon, 24 Aug 2026 18:35:42 +0800
Message-ID: <20260824103542.633058-1-meng.li_g@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720-husb320-v1-2-4a1e259d7dc8@163.com>
References: <20260720-husb320-v1-2-4a1e259d7dc8@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa033575f1a09d6kunm35993694388e69
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZGhkYVkgZTRlJTx1IH0xDTlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0
	hKTkxOVUpLS1VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=V/2Scb4a6S8l70o0m8mJ4NgpPSMqoM1LYpG+3d+EYT8xfUIjGZJbzUzIu8LtvBDRdNsq98qO/TqGS3myZirjgaKwlsj5UE1I1FOFOd7YnHqTdVtaUyVK+K4MmRLj05tLs3NkmS2LOCHC7CVEk8MWijrETn150MGfuZEl3kz7MjU=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=3Q/20d0kccxgkzQIjYwDSifLlAh/LW3zs/YMLNElp58=;
	h=date:mime-version:subject:message-id:from;

On Mon, Jul 20, 2026 at 04:17:12PM +0800, Hongyang Zhao wrote:
> The HUSB320 is an autonomous Configuration Channel controller which
> supports fixed source or sink operation and dual-role ports without USB
> Power Delivery.
> 
> Add a Type-C class driver for attach and detach detection, orientation
> and Rp current reporting, platform VBUS control, USB role switching,
> Try.SRC and Try.SNK, and audio and debug accessories.
> 
> Signed-off-by: Hongyang Zhao <hongyang.zhao@163.com>

I tested this driver on a Thundercomm I615 DK based on Qualcomm
QCS615, using the following device tree configuration:

&i2c3 {
	clock-frequency = <400000>;

	status = "okay";

	typec@31 {
		compatible = "hynetek,husb320";
		reg = <0x31>;

		interrupts-extended = <&tlmm 55 IRQ_TYPE_LEVEL_LOW>;
		pinctrl-0 = <&husb320_interrupt>;
		pinctrl-names = "default";

		connector {
			compatible = "usb-c-connector";
			label = "USB-C";
			vbus-supply = <&vreg_usb0_vbus>;
			data-role = "dual";
			power-role = "dual";
			typec-power-opmode = "default";
			pd-disable;

			ports {
				#address-cells = <1>;
				#size-cells = <0>;

				port@0 {
					reg = <0>;

					husb320_hs: endpoint {
						remote-endpoint = <&usb_1_hs>;
					};
				};

				port@1 {
					reg = <1>;

					husb320_ss: endpoint {
						remote-endpoint = <&usb_qmpphy_out>;
					};
				};
			};
		};
	};
};

The following tests passed:

- USB device/ADB in both connector orientations at 5 Gbit/s
- USB host with a USB 3.0 flash drive in both orientations at 5 Gbit/s
- 1 GiB read-only direct reads at 115 MB/s and 111 MB/s
- VBUS, data role and orientation switching
- No interrupt storm, USB enumeration error or I/O error was observed

Tested-by: Meng Li <meng.li_g@thundersoft.com>
