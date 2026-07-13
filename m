Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A783E0C47
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 10:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783938559; cv=pass; b=FHrt/yTEQ4fqTk3FyzbCGEtxFlH0O/cvnDg3HVVuFbXlLcqm2HBYZBPKclG64fdHkbs+3pgaHkEp6jCOWMf6u4tbP2N6e3jlHOeu7mYMiUNc5UTAB2a5douTQGtM44MaELF2lVhjeev2wIL/XD3/w+Bk3y/l1BPxIE+f5jB6FpI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783938559; c=relaxed/simple;
	bh=g9PH7rit3zO//u5Hq2QTKSHhPM7nodoH6Z5rCiQghkY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XRbjfBUJ0nFnBhkDDIruLTCi/X4fpBHTZPkz3P1YCQU8jmGK8hCan0Iq3MJfCBoGCnKGV6bRscIBoxqmvpRxgoxukVLWZksQXpNFHX+SclDBxGziPCaVl3XK8YsZZI8LlQDBhgodpLxmiHkMB9M3FG7PjL8z+NuXt/oppWItSMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QNFOxgh3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G7kxtqMe; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QNFOxgh3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G7kxtqMe"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D9drT6955819
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 10:29:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ooopbZ8BXUYSj2UczjbYKP/YkkGSe5M/iCnsrnvSEpM=; b=QNFOxgh31F+aQwWH
	ovN+MuWYrQupUnEJ4E05qCBe2S9rP7KHAIzWX8QuWwVLkBnQCTy1Hz9uUXC1S7DF
	8ziWPWrYXfAPxVQX7yIQ90tkfXiCc0VPr519QCrHicbq5mx/va6EOAY8OJvHnMC3
	RZF+ARzvL1gWrkTRgAmMOSEPMRMgnJsk3tSucarsmgrls/L4q+xlgyoSuIM/bgkt
	B+B96eVD2U0ghoOzlEzmHlymMGN9Zy4snq+v8VItrjMOWQ4hjzJIFO+xwOz3UgBn
	1yZtKxrH/rfPDe0dXOHL2JQMVO51Kqi381IJox02JTjVELMpumm0HRsXH/c9hr2z
	cyqT8w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwk9r5hj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 10:29:16 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8f0f45415cfso49161616d6.2
        for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 03:29:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783938556; cv=none;
        d=google.com; s=arc-20260327;
        b=Q9ccetkitpNeBxrrplBc2kNwT0YDcY493xzY7m7pZmlgG4bAhT0du6QgR/gWB0M+J+
         Z5iHplsKMYkJcZPtzZo+HoFERxntekS/UcvIHUmkPobgj1244XNcXt5cjr00MN6cTgls
         bb0wX0aeyAVK1ShT7/YZ1FCkhr87y5whujKisSsF2mNiOqderGVYlQsJHeRmhQVuTK5K
         13PZJyIkam43b0Z7+ULX4i0KSN4sZOdJw7Y7Fww92e39KXixiJtM4+0evlRbLD5Qp7XF
         wZgXdpAbzPxD3DIKqfyKrtNwX0wsMj/QAB6J8zvht969EzXVkSkgJXpD48gpN11RbFEc
         th6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ooopbZ8BXUYSj2UczjbYKP/YkkGSe5M/iCnsrnvSEpM=;
        fh=c4tA+czghHfXXF+zZaNNi6vtHsSH+C/kWs/DoJrDsXg=;
        b=nsg+f5jCHfdi04iM1mASj8UM1aG7fzqdz+YuxrxbTHMrQD9L7FYOuD5R9lSHjy8Of7
         Ih0T/0e8xarq+VfMGjx1lhzFnWaOt6BPEaHYdruTZM32xrwAk7DZqDChKKqO32re1zbE
         WRv1Lkn/8rkV6xHZMBfle6RWkntKmfbv02fq4TmfArz1OYMff9nF6gAjNGr3JDH/WlDo
         izklAikDkMOegO5w+z2LP8CGI0eN29TrBXOY1wQJkRC6t/JkV81wsjtvRKrBi0LZsPgY
         huSXZnZmGsVrah2FERz5RDPY6/xzf6tXTcHQ6uX8Dst2YZk/k5MibwWnjjv1HEew2AZ9
         6vQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783938556; x=1784543356; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ooopbZ8BXUYSj2UczjbYKP/YkkGSe5M/iCnsrnvSEpM=;
        b=G7kxtqMeECI0wOjoeOfWjKvWJYaxKH8+o/+b0CGIY24b4rLI8qDRn2gIv6OE/ADOj1
         XlwAlTi0gwkccLwXnu+CRigYuCwy+6AJ/6B+TkPFlVhA+taQEGm+YvbxTwchEJE45Gq8
         L8fsHp9VnxaakJLBLhDvesJzRb0vsSofarjdE9evF3g7IzpWRTrZP0awjtr12lS6nHAj
         hRuS+rJAHKSP1Js83ha10t5eyEERFD1/6mtETfNKxhVzYlRdaeaJ03pD64actt9fwo1X
         oLIr0yJkOj6jBWsAUK9FSujDVn8dDqWyNJ0H73aI5ytp/ZbiSBjeGDwJfAYKU+vrfh0O
         ZvvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783938556; x=1784543356;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ooopbZ8BXUYSj2UczjbYKP/YkkGSe5M/iCnsrnvSEpM=;
        b=BKkNE8OlyZF8tZkCK6o0XoSfLlB6DvTXLOd5OWkb2vQOdJmdpYArfcH8vDvPD57AIF
         rFw+pVQfoL3lfGfJVrWGnr6bTJwIJbSO/xmP1EyFsRbR1RWOmFZQ1vyR34BSASCc6ulg
         ndPpOtVaDo8b6M9whjhPWN2Lc/PZDJUDC84c3e5M9DED6UIqu7jm//DL+rC4YwkQD+AG
         0IpB3YBo/rBJNO03LqOpmwml/qzdMXOc8ra8PN1IxarpZoV7JFUjbpPub3hS2uWTtBUA
         9wysTsuH91Vgve15QoaItQQ81iEfdAJ0G/0vV2f7cuTvStB7ddCV6+9lso+0kxCjzn3k
         uo6w==
X-Forwarded-Encrypted: i=1; AHgh+RrlnWMstIF6G8CL9VqmjdYw9lVk/xi5BLxNU6bth1UikUp43NrpKbvp4eMPguR9qzmG6SfPvNIc+Qs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8B2TprEO2NVyr/V1Pm6qE4RGRwB4AEmr9c8MinHXwwIOOqbvL
	V/FkB2sL8Y4yJiYmDzIsAP6NBNmAs1cMBD3788tLdkefGDiCNGRJhxw9rmxKz8NsltXPzg+RyNC
	ijuv796SCBkP5vwqxegEQa7BHiTHNjkJjRjnKojml9K6+lp9mogUAmyCylFqQeastL9SHcGKYgg
	zGwfhYdGMzS7CZyzt2Kt2CujypMXyG/5+lKKEYYg==
X-Gm-Gg: AfdE7clu+L70VGfCNzrcKmZDLpXquG5Z7Fe1vD/4fkm2g8TBl5CaH4Q0d3tl5lADdp2
	9p+DNiQAg0Uap9W16KOhp8ksf7X/v35+KDKNfsKCmooTg62yGWhx1j7UABofue6rge7Y8aBv1tv
	FHtVjzER4ojeMvDNGGOmgoaX74Y4jcxzaQYeWk3jbz9RMxtFU17RmLhRiV5Cf2fRtVy+jL
X-Received: by 2002:a05:6214:238f:b0:8dc:2c21:32bd with SMTP id 6a1803df08f44-903ff76144dmr97564326d6.1.1783938555882;
        Mon, 13 Jul 2026 03:29:15 -0700 (PDT)
X-Received: by 2002:a05:6214:238f:b0:8dc:2c21:32bd with SMTP id
 6a1803df08f44-903ff76144dmr97564106d6.1.1783938555502; Mon, 13 Jul 2026
 03:29:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706-pdev-fwnode-ref-v3-0-1ff028e33779@oss.qualcomm.com> <20260706-pdev-fwnode-ref-v3-11-1ff028e33779@oss.qualcomm.com>
In-Reply-To: <20260706-pdev-fwnode-ref-v3-11-1ff028e33779@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 12:29:04 +0200
X-Gm-Features: AUfX_myf4-1EuuJEsM9iEruoBmhvEE1_shBmpnLHYi6rPSO8vgxEgiRb5eZm2os
Message-ID: <CAPx+jO-P3Yt6T5Kb97MjmMB1mYeEgjStCkSACM_wsrqsBVFEvA@mail.gmail.com>
Subject: Re: [PATCH v3 11/20] pmdomain: imx: use platform_device_set_of_node()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>,
        Mark Brown <broonie@opensource.wolfsonmicro.com>,
        Thierry Reding <thierry.reding@avionic-design.de>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Doug Berger <opendmb@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Matthew Brost <matthew.brost@intel.com>,
        =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Peter Chen <peter.chen@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>, Bin Liu <b-liu@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>, brgl@kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        driver-core@lists.linux.dev, devicetree@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        iommu@lists.linux.dev, linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, intel-xe@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
        linux-mips@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEwOCBTYWx0ZWRfX0HeV8olJNotP
 ooyT8E9LvTWqPWaHkm4pacUVvakmrHS8A505agp7uzxjfNsOImGHZuSWeRL3tldSa57P4XPV/px
 Hu4PJLCbAfBWqqLaGko3cqYMdrSdJpIIGQRiI9odC9Ki/MDZDkVRTVUZUwtKkFop0W0Mfk10ovi
 B3ETehf5kMXI5priFb/1sbeEOgpTotnbIZFUoBHyOybXHkuxMMYvYqkaDmEX9NDkyASHpAT8VXJ
 ejdyzNfsbpYqgx/Y8d41AEl51k77BwxSuu7gyFjM1d22wyvS7t+orbGIVsHClpkx84dBFHApy48
 i9PlhtHQwwk130yE6CViD52t72bZMxqgEI3hjjiABnFig3egl50HFk3mfDqHtPTDJzsSu9mXjex
 gHnyDXEVFwLYBeTmEFX3eT0UHA11g/6N2dj2ho5lsbu8jL4L19RJeGGiNS+d6MejjD4fvrDKFfh
 CtazOFUuEfdd4WVeiXw==
X-Proofpoint-ORIG-GUID: NUPKehk_FiZ2SJC3dDD3Rxyl_ppaPja0
X-Authority-Analysis: v=2.4 cv=UMHt2ify c=1 sm=1 tr=0 ts=6a54bdfc cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=8AirrxEcAAAA:8 a=QyXUC8HyAAAA:8
 a=VwQbUJbxAAAA:8 a=-ghbRyKqcrg4NgclPfMA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: NUPKehk_FiZ2SJC3dDD3Rxyl_ppaPja0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEwOCBTYWx0ZWRfXzzN8wY+ajeYB
 zRhtVc1+msEFKy6Sr1XOA3EPV1VlG8XKpOPTXm8JwQpGzLCHjggTppJRhPpqlla0KmvTn/GqawF
 l7Yy3MrGSRi+cfRDS96yCIRtvR1f1Gk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130108

On Mon, Jul 6, 2026 at 2:45=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> Ahead of reworking the reference counting logic for platform devices,
> encapsulate the assignment of the OF node for dynamically allocated
> platform devices with the provided helper.
>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

If not too late, feel free to add:

Acked-by: Ulf Hansson <ulfh@kernel.org>

Kind regards
Uffe

> ---
>  drivers/pmdomain/imx/gpc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/pmdomain/imx/gpc.c b/drivers/pmdomain/imx/gpc.c
> index 42e50c9b4fb9ffb96a20a462d4eb5168942a893c..abca5f449a226fbae4213926e=
1395c413160c950 100644
> --- a/drivers/pmdomain/imx/gpc.c
> +++ b/drivers/pmdomain/imx/gpc.c
> @@ -487,8 +487,7 @@ static int imx_gpc_probe(struct platform_device *pdev=
)
>                         domain->ipg_rate_mhz =3D ipg_rate_mhz;
>
>                         pd_pdev->dev.parent =3D &pdev->dev;
> -                       pd_pdev->dev.of_node =3D of_node_get(np);
> -                       pd_pdev->dev.fwnode =3D of_fwnode_handle(np);
> +                       platform_device_set_of_node(pd_pdev, np);
>
>                         ret =3D platform_device_add(pd_pdev);
>                         if (ret) {
>
> --
> 2.47.3
>
