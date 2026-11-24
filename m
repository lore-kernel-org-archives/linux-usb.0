Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550506;
	b=0QcgmrprLhgAGb+XN+tk+F3IqWLk422he170amAPyq0MktyhdipUsRcsS1abyyIkdd4A
	 oDhaDlbl5xIM4K0fooi8rgcWgnnIYlo0EOW6Plv3CB67SMEGwKHngkqE5On1PCe8LlIKG
	 nW14Pmx8oqOQgQbP02RUkRQOG2/QC233sbEGOlPUMspEQ2rHrIfw02h+aPKPsndO1aMd4
	 6V8BjBKtQGbd2mvckOXaioinLcSx0NDnrYdAGnoS+A+frwVAhBqw/6d0phCqd8zTLw3rY
	 p7B7wMf+XvWEuP79d8dDNMsAN2Y7I096DLLTxWwrNEmLRrwx2zxRstyTI8p0sgPJTzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550506;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1gByKWms90rx+ZYM2PzY3CprddTIzxOBqUOzZScJ+EU=;
	b=yhZMzNua3uTipanNvwqZlWm1DJHt7zuNjfs/aIqLNZGq0Dvg+/qlMNMMc4mKiM36n/Ka
	 /I0cB0IbROwDQbiEVIOuFcDa1ngtM9J9Xm+3ku5jvB6KyaWsUCdOohnWvt3qtgHqP2SfP
	 CWLPgJ1bhXRCk5WgQGYRZC9shikW2JrArnMy7cOGnQFSZCtcrU1s5ANxOEc0I+Pvb2phe
	 5XUBZkQT5voC2DjH/TTiuGPaBiKdZw9E1wrbrFxch7YTufeWPmljhL0UuWVlJBOnBgONP
	 8eBaoGZfyw1SdzYPPvQnpZVnCvfy9xj6dk5zaCAfC7SXbwSvNw6ouItpBH8rJLV8djQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nUBHRIjn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c1sBcqxf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E335B606A32A
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 20:01:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E335B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nUBHRIjn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c1sBcqxf
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOJKhbW2855279
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 20:01:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1gByKWms90rx+ZYM2PzY3C
	prddTIzxOBqUOzZScJ+EU=; b=nUBHRIjn1pCmJwzztA1YcOY736l7TtuRsJ6kFb
	jrw2ctcgfWvZaGABsWaQT1OW5YcaZvIfaiDwWc2dItZAOwcUv8gwNzwNtM571xit
	Daj2q3OtyI+HafktVNFRLubsVdliReBEGj/E4ce0dz+Mrej8lBDfD8FhJTV7Y9oI
	JbkPSXZkjhH2n+0wRIQHO/fVx3ZCq0hJZeFWWECOeg6RIuvGymSp974It1srwNoR
	fTSAxLwrSfJwQsXyN4vuh4vYoXTTXhsebM+ASamBS8v04f7ooCf3arXUZ8545NWr
	ef2jmm91CyrkNS3UsqDjb4mCqlWBW3e3sZC3NGRaeyp3uaiA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gnf855f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 20:01:44 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ee002e05f9so195710e0c.0
        for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 12:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795550504; x=1796155304; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1gByKWms90rx+ZYM2PzY3CprddTIzxOBqUOzZScJ+EU=;
        b=c1sBcqxfc8K+YbKgB3enltRYc/kIOVUf3QXT6rBH0FCzSxahocnHtHegntvjSHBHUz
         xM69wBOCCuE2WyFyY/Fzr0+sxeEhSVLuGj3XLt3gyDreWp01MJwHo2amYH0ywHctiFzT
         2WLNmVLh3ab0bvdU6FypROZQQt4OLbpCBx7GkJfEaXnSpAXonbZJcEyEOiqE/1mtN4jZ
         QcArp/h3miNyQZhIIlAVxtJnPt3I6YGIMKmguuNGDNVbQz+lXQYVLitDu2TAlpI7K6z4
         fuB3P+LYfy7PYUnL+IUH4N/5OLRdMg2Vb3I9fisI9VuWAJXW2YAUzOKf9TnKSJcR2x7y
         ybKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795550504; x=1796155304;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1gByKWms90rx+ZYM2PzY3CprddTIzxOBqUOzZScJ+EU=;
        b=Di3Xs3jo7UUqn6lszT1DpF43X+bFxKt4VBKLEQ+NuZh6/hCzW4grV2+n/TKixRzlQ9
         rJCws4Tf05ptBUJ3aYWdkUzAv8aCnhaNyNPeRxa045j2CNmNLWxF+H+E0ySWwkN56FMZ
         797z2O/oZZgbBbzY6Sa1rKgmF1I/GXHeZbYP1m08hfZMdEM28afKDqgMPaCCi+/SrNSg
         Sufg0ir0VVYggsK1Q7WUV2fqHBEVtvU7berEadpWyyyUzfDoY6LFSYmg7yw7h/QuYqi9
         ZlE6xzRwMl6GlXXOqhgvu4vsnlwL9/CKOi3ilxF6UJA+n7iWt+8f7QynoOar5fk9gV+7
         43xw==
X-Forwarded-Encrypted: i=1; AL+hErHWaOoDC7wgWcwP8sJLlUfAZqhwD1/1qGIN868Km3rAcl0q6BN5Aewz2OAwqssiFI0gt6yVfQou1rM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9M4vnjxdfKLrn8TQPEz6bFLYlH9WexCB3o2NDlCljjV4SFb4Oh
	CLN4MMzq+Lck3EkWmoelOno0Hgwk/UYrhKUAFO12MKX7hhJ0H/Vkf3C3g3mFSs5AtDgovqYOtkg
	Z15ubOcSRKbqXKwvOIvHDGLWXgF7pwAzuIhFtwzDWZ7wCJV9wvWo/bPUCfoGajS0=
X-Gm-Gg: AZFdTZdI3U8MOxglyDEjtIFTd81+GZgSO1wUskIrr8ltc4P9wlDUJXX8TzYYrGc6d49
	YcDZpExWGDtEBqHYrhaKbcREdpW7Hh8sjxBAZwoimcUBsBY4SyevLs4TO5Ju7Jmh9sTpYnKJySk
	YjcPAWr3IdGjuPb7IcYaBz2c9gmSIXpiCAJVVyKXby0scvX1SG9PxJ/sGD/Rg+R9OrQHwCiaPID
	LlD1X4adTSoIMWNBo9OsdAnwkqU3/768uIVS+AZFQ3XxRqI5AQ9oFOWrWOcCmeJlQaQ8xK9ZZrt
	2B1RvbofARIqqlBRYcuE3YjQZT7L/44mtQn6Wxxr3GfNDSB3qjosqMV3tUrF692FhXlS/I/QxWO
	ZEIqYXo7UwStrkH00tAL5v+6H+FBQGq8j9TpCUwAZouJp/3z16cPOfsIOit1sC6hYesMIfyhR87
	8XCRPF3Xc=
X-Received: by 2002:a05:6122:680f:20b0:5ec:b145:889a with SMTP id 71dfb90a1353d-5ee8aebba7amr10992214e0c.3.1795550501839;
        Tue, 24 Nov 2026 12:01:41 -0800 (PST)
X-Received: by 2002:a05:6122:680f:20b0:5ec:b145:889a with SMTP id 71dfb90a1353d-5ee8aebba7amr10991920e0c.3.1795550500218;
        Tue, 24 Nov 2026 12:01:40 -0800 (PST)
Received: from KDYBCIO.eu.qualcomm.com ([2a02:2a40:15fe:b200:7192:a019:58a4:eb4f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85399e2esm517678195e9.7.2026.11.24.12.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:01:39 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [RFC DNM PATCH 00/15] Qualcomm USB4 host router
Date: Tue, 24 Nov 2026 21:01:29 +0100
Message-Id: <20261124-topic-next-20261116-fsm-mvp-v1-0-a9b45c69cd38@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIABrtBWsC/yXMQQqDMBBA0avIrDuQjBJor1K6aOKknYIxZFIRx
 Ls31uX7i7+BchFWuHUbFF5EZU4N9tJBeD/Ti1HGZiBDzloasM5ZAiZeK57NOow64bRk9NfeGdP
 7kSJBO+TCUdb//f44rV//4VCPJez7D6+h/WN/AAAA
X-Change-ID: 20261124-topic-next-20261116-fsm-mvp-b936003bd2f2
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <westeri@kernel.org>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        usb4-upstream@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795550497; l=7195;
 i=konrad.dybcio@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=A+ZxrCHc+xf8sMBO+IHGTxF3X/zbPOdINNbdHlkOLNA=;
 b=5cbCykZEDXFsQZZ+XcavorGkQhh0sBNtwv2IC4avWJ42tQ1OxbK8wzU1ieoZNBVY+h/jWegS/
 EJ0dmLm80EQD/WK73n9pQNYozrvN9nj5js9NDwJ3v+pJ66kPr1hIS5F
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=SGRRMmlLTuP/lGKdQ0f4KPvxn8VVsXtXaTpdGc8i82c=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfXwCO0CXsko3zv
 9UgTiTPxRVR8Y7GEHBiLH2ItSeh7/bWu7FlbcZjLX6c+YuTCMhxtrNAXXgXyyn/UeuQPgyDvPo5
 VmtCkDXHrnQx5TcCupDxAfgiy/agmy8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA3OCBTYWx0ZWRfX0xUQ3mGJoCiZ
 CIHSZTIHa/lRt0eqSSzsECzq9Zws3t85Q38cjCVLW0ElGtKTuB2fRXaRrZ2INOTx9ZZY8s14Kz9
 NIPP//2EaFFvXzCNRktXEaTs9RxvdX3wNkeSmL/0jHGOexrDooPa6Tx1Z9wPtHfqUrMA19x+rLa
 OsOgmW0eeVs7NNuk23oQDCnWnPYUp49z4FPq2Wsj7nvL5GkltDgYgA3ZAwQ1wbRgwhhA1MlFxlk
 MbVXqx7qF+f9AnYLFHfqKHFq4Lriy2B2V0eTzdGzUTdilHEy9ukr0JYVVmLPCy5OHnojHqIlDxU
 umDCpl4DSNtcRVujvz8GS0i2DJ7r87QYtNGF6i3RbqDx/y2669hXS+rcwXVuCKrOJ++2PpeSMBW
 /HFk2CSjpMhA9pJyuQ803uVqIigcCfXgx0aUiksheusWekXpclBbvIkj4Vsl66A07gE9JQrroXT
 9qM+9LHScjFr0wMvfYw==
X-Authority-Analysis: v=2.4 cv=f/Xdl+yM c=1 sm=1 tr=0 ts=6b05ed28 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=Q-nnJTdTW8WZejlXziAA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: q_ZtJRrgFOAMZTuwsq_BsxJnzj501Trg
X-Proofpoint-ORIG-GUID: q_ZtJRrgFOAMZTuwsq_BsxJnzj501Trg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240078

This is an early RFC, mostly looking for acks/naks regarding the
bespoke power state machine and Type-C handling in qcom.c. This version
of the driver can power up the hardware, have it suspend/resume, but
notably not drive any tunnels (as that depends on dozens of patches to
other subsystems, many with shaky dependencies on the still-forming
usb4 dt-bindings [1]). Absolutely not intended for merging (unless you
want to take some of the intermediate tbt patches, Mika).
Speaking of dt-bindings, this posting comes with none, as it makes no
sense to waste maintainer time until that GitHub discussion is settled.

Said state machine is an attempt to tame the delicate clock setup,
which if we don't get perfectly right results in the machine hard-
crashing. More on that in the big comment at the top of the driver.

The Qualcomm USB4 host router is an in-house design, implementing a
standard NHI front-end with a lot of vendor glue. Because the USB, PCIe
and DP blocks live outside the subsystem (and are wholly disjoint), a
lot of elbow grease it required to have it all behave (similarly to the
Apple implementation, but with more manual clock control and firmware
handshakes). Native protocol controllers can only resume after the
router has re-enabled the links (which collides with today's notion of
nhi_resume re-enabling the tunnels), so that requires some
consideration (again, not included in this posting).

USB3 tunneling requires:
 * a bit in TCSR (tldr a syscon) to be toggled and the path to be
   enabled
 * a register set in DWC3 to work around an issue with the USB3 adapter
This is a fairly low-hanging fruit, but still depends on the bindings
to get the device link changes in within the USB subsystem.

PCIe tunneling requires:
 * a reset in the USB4 address space to be asserted
 * a number of additional settings on the RC side
 * standard PCIe hotplug otherwise works as expected
The link itself works without much effort. How we set up devlinks and
whether we can go forward with or dispose of the router's power state
machine will shape the suspend/resume handling there though.

DP tunneling requires:
 * handling a secondary mailbox within the USB4 subsystem (not
   included)
 * setting up the display crossbar/mux correctly (any of each routers'
   DP adapters can be muxed to any of the available DPTXes)
 * settings a couple registers in the DPTX
 * driving a secondary AUX bus from within USB4SS (the AUX controller
   in the DPTX is blissfully unaware about the existence of USB4, so
   the OS has to ping-pong between them at runtime..)
 * HPD management
Because of the muxing and runtime AUX switching, this requires
sizeable DRM changes, including Luca Ceresoli's work on bridge hotplug.

Additionally, the hardware is constructed such that the protocol
adapters need some of the native controllers' clocks and power domains
to be online, hence the odd DT references.

The uC doesn't implement a CM, it instead does some housekeeping
functions, but because it doesn't have a view directly into the SoC's
register space, it still requires a lot of OS coordination. It does
however take care of link establishment and some of the TBT-layer
chores (such as sending PERST# packets to PCIe adapters). It requires
loadable firmware which will be posted to linux-firmware soon.

This series runs as-is on a Glymur CRD board, minding its limited
usefulness given all of the above.

I know this series is not the entire feature set and that this was
promised quite some time ago now, but as I was humbled to learn,
sending 80G over a wire is no easy feat. I'm looking forward to
removing the remaining roadblocks and hopefully getting there in the
upcoming year. Please chime into the bindings discussion on GitHub if
you want to help there.

Dependencies:
 * https://lore.kernel.org/linux-arm-msm/20260409-topic-phy_fastclk-v1-1-6b4aaee56b90@oss.qualcomm.com/
 * https://lore.kernel.org/linux-arm-msm/20260928-topic-usb4phy-v6-1-815a73b063ef@oss.qualcomm.com/
 * https://lore.kernel.org/linux-arm-msm/20261123-topic-usb4_clks-v1-0-531ab5635c03@oss.qualcomm.com/
 * https://lore.kernel.org/linux-arm-msm/20261117-topic-pga_nousb4_glymur-v1-1-0ede74e620d0@oss.qualcomm.com/

The base commit (contrary to what b4 says, because of said
dependencies) is next-20261116.

[1] https://github.com/devicetree-org/dt-schema/pull/196

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (13):
      phy: qualcomm: qmp-combo: Add USB4 power_on/off to de/assert USB4 clamps
      soc: qcom: smem: Add and export qcom_smem_get_serial_no()
      clk: qcom: gcc-glymur: Don't poll the status bit of some USB4 clocks
      thunderbolt: nhi: Clear ring interrupts when not using MSI-X
      thunderbolt: nhi: Process ring completions in the threaded IRQ
      thunderbolt: nhi: Add pre_switch_suspend hook
      thunderbolt: nhi: Resume the domain if the NHI suspend op fails
      thunderbolt: nhi: Resume a runtime suspended NHI for system suspend
      thunderbolt: Raise TB_TIMEOUT to 500 ms
      [HACK] thunderbolt: Refuse to activate DP/USB3/PCIe tunnels
      thunderbolt: Introduce Qualcomm USB4 router driver
      arm64: dts: qcom: glymur: Add USB4 topology
      arm64: dts: qcom: glymur-crd: Enable the tertiary Type-C

Wesley Cheng (2):
      phy: qualcomm: qmp-combo: Add Glymur USB4v1 PHY sequences
      soc: qcom: pmic_glink_altmode: Enable TBT/USB4 negotiation

 arch/arm64/boot/dts/qcom/glymur-crd.dtsi         |  107 +-
 arch/arm64/boot/dts/qcom/glymur.dtsi             |  703 ++++++-
 drivers/clk/qcom/gcc-glymur.c                    |   12 +-
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c        |  321 ++-
 drivers/phy/qualcomm/phy-qcom-qmp-dp-com-v3.h    |    1 +
 drivers/phy/qualcomm/phy-qcom-qmp-usb43-pcs-v8.h |   22 +
 drivers/soc/qcom/pmic_glink_altmode.c            |    5 +-
 drivers/soc/qcom/smem.c                          |   22 +
 drivers/thunderbolt/Kconfig                      |   13 +
 drivers/thunderbolt/Makefile                     |    3 +
 drivers/thunderbolt/eeprom.c                     |   17 -
 drivers/thunderbolt/nhi.c                        |  168 +-
 drivers/thunderbolt/nhi.h                        |    4 +-
 drivers/thunderbolt/pci.c                        |   15 +-
 drivers/thunderbolt/qcom.c                       | 2299 ++++++++++++++++++++++
 drivers/thunderbolt/qcom.h                       |  251 +++
 drivers/thunderbolt/switch.c                     |    4 +
 drivers/thunderbolt/tb.c                         |    2 +-
 drivers/thunderbolt/tb.h                         |   20 +
 drivers/thunderbolt/tb_regs.h                    |    3 +
 drivers/thunderbolt/tunnel.c                     |    2 +
 include/linux/soc/qcom/smem.h                    |    1 +
 include/linux/thunderbolt.h                      |    8 +-
 23 files changed, 3914 insertions(+), 89 deletions(-)
---
base-commit: 516d5c8f674bc07eb35c3b97fc21e79e41158dee
change-id: 20261124-topic-next-20261116-fsm-mvp-b936003bd2f2

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

