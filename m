Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A4031A9F;
	Mon, 16 Oct 2023 18:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rZCSKSLx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E9A4C433CC;
	Mon, 16 Oct 2023 18:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697480528;
	bh=exthi0CNeGhJZAzUytlzkiBQzqs+H7o+txhy02NswR4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=rZCSKSLxd6FMwLmL7fkW0cppT0eyC2rww3BMNSNg9uv20qnQHnfHYk2HxDhMVOZgo
	 RiVEg/EuKfdGlUSZa80vmrCM+l6kVF8uxxSvH5FAe+LfrXZzAZhayr9QeiZUXCxXg0
	 QPGLgLphqFGvtP4ptXm2erlQmK438lvpTkBh5qCOLQ7VzXZ03GBHORGCuI+BN+ZjU+
	 06wrs40OsGjU2VhnulMVo0apzgOzHuyB8GMsfvU+/3P/WluNw8UGBSdGqVrqGVnD8d
	 6US1kProb8LRq2bMEZjUiHjNDSzYMvYP3TQytKWxPh0qQmTYh5EcAsTW/aOlwWLa2c
	 5E+o5+VplMbDg==
From: Bjorn Andersson <andersson@kernel.org>
To: agross@kernel.org,
	konrad.dybcio@linaro.org,
	vkoul@kernel.org,
	kishon@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	quic_srichara@quicinc.com,
	quic_varada@quicinc.com,
	quic_wcheng@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Nitheesh Sekar <quic_nsekar@quicinc.com>
Subject: Re: (subset) [PATCH V4 0/4] Enable IPQ5018 USB2 support
Date: Mon, 16 Oct 2023 11:25:50 -0700
Message-ID: <169748074955.1245023.12861217493042461028.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230904063635.24975-1-quic_nsekar@quicinc.com>
References: <20230904063635.24975-1-quic_nsekar@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 04 Sep 2023 12:06:31 +0530, Nitheesh Sekar wrote:
> This patch series adds the relevant phy and controller
> DT configurations for enabling USB2 host mode support
> on IPQ5018.
> 
> Tested with a USB Mass storage device.
> 
> Depends on:
> Link: https://lore.kernel.org/linux-arm-msm/20230831030503.17100-1-quic_nsekar@quicinc.com/
> 
> [...]

Applied, thanks!

[3/4] arm64: dts: qcom: ipq5018: Add USB related nodes
      commit: e7166f2774aafefd29ff26ffbbb7f6d40ac8ea1c
[4/4] arm64: dts: qcom: ipq5018: Enable USB
      commit: 80a438775aa398751229bcaed15459f3acdb645f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
