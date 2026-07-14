Received: from CP4P284CU005.outbound.protection.outlook.com (mail-brazilsouthazon11021090.outbound.protection.outlook.com [40.107.202.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E247478E4A;
	Tue, 14 Jul 2026 13:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.202.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784037000; cv=fail; b=r+HtoHXRfixkfTV/696ptNiyqPgDI9GGKb80DHQAMFSFT0RXGqvJxU3LKTvrWFLhj0TDPQUH9ven9g3hAYCKd8tVTB9/nk8oAMR5o5Nfijdl0NLqOhyZRaJNt+mz7ABtOF2/2VM2XGiB/r1lE029YyF3YdyAaN6bGtWQzrGrMK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784037000; c=relaxed/simple;
	bh=lFGQJERmeLv/sksCMd/B+jLnotp6Wg9cwnHwDt8eYaI=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=l6vZRIEELJPz1XGd3zubW5F8B7XUgbtzNWY2YLmXfvsOl0sPRgv7jxHY09zynJE83pL74rL+6VUFu0U7yAttParQLRGoZzJWZphZWVU0BJCH4TnAsd3QH4hr//FWhyJmmHHg48myqS2B+zDkRAzQEZAPwKzXL7Je7FQQMY7ofFI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lumal21.com.br; spf=pass smtp.mailfrom=lumal21.com.br; dkim=pass (2048-bit key) header.d=lumal21.com.br header.i=@lumal21.com.br header.b=WsxAW69y; arc=fail smtp.client-ip=40.107.202.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lumal21.com.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lumal21.com.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lumal21.com.br header.i=@lumal21.com.br header.b="WsxAW69y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rhWdSTJztMXvzAwwh4rfqQVThGGzxUlRp6fG2STh+D6vTOoPg60y5EPaDQhnmy8sK53Nl3N/9vRTqI1RYrrxGf10/NDNNwWzd2FQJXe2lntHpEK90W88JF7XzrBF+uJugLaCfkjGB1Q9UnsNnmcdFl4GHFLpDaPuxi43FXO4ZS8r7T9fuaoiKyFnuEHiWuxEYgPYcPSOoWFaAZg5syz2OztmaZ3YjRWD+AYnK3bTAD+Y3avxWYit4pYTCG5xxQKp7XCdlDbh97IVguskT+fBSnDdKgFGMPOdBzX8oDWGigb8w0LEB4toi1gCNo//Q29Qhw7SF/COHnKpdr+VC9dQqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lFGQJERmeLv/sksCMd/B+jLnotp6Wg9cwnHwDt8eYaI=;
 b=n7pM2XBgsLknj6pyFCYm2ErpEaXAS2usEnKlctBaKvn47OIU+ZtD95tpdZVbPwx5vPBTcDCOfeWFWynSieR1AC5Zknh9HEgHnM5dr33Rn7rxj6wBBKUND6u26VjiP149uuHQXxNyCX1HIBL9SK5nnAY0eRVB0UBUDFLHhS93NHye3S7or7qrE1gbZZKHeU8+wcPVK0HFGP4x/LU/bkpqLAqUfjHtMAshCKRSuvNRpMyHf4l1QzC9qBjguBwB1tu5w40AB6Su13+hUwtHM2GYrzuxjib3YvHl6vcD2kry0+YyqG1wTu/uN1Wa3GwaYRjc0DrIPuWclwci4BF43Y93wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lumal21.com.br; dmarc=pass action=none
 header.from=lumal21.com.br; dkim=pass header.d=lumal21.com.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lumal21.com.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lFGQJERmeLv/sksCMd/B+jLnotp6Wg9cwnHwDt8eYaI=;
 b=WsxAW69y7s1BszcW+YOyAyq9bsM3v0uCv/7FPME13h4Dyc9TtED1THBeQDb2mtq8kJ6500quqAL2mYaZaj9ST3/KiugYC2rcUZm9feKuR3JvBy1WNed3FOH9LEjpxhgpeJJRByMEZTkXbtMDSfPNLt1UaKJWuAWj2/PZjwSJxGHXzh8rMfdJygKtp/mRkbOovu/6q4VeZcPPdtTkMORzb9EifXgJryYfh0I9w4eDEiVLCFfSq9a3bF8lRZYlaVgox9Pqr/YsbFbrS8vBUJFzgpYiH3COVgUXEy4YdXzKkC7In1jIhsXH+LhoYhLyB+NsXi7S5BkqZXc89UmASzyJGw==
Received: from CP4P284MB2402.BRAP284.PROD.OUTLOOK.COM (2603:10d6:103:2aa::9)
 by ROAP284MB2027.BRAP284.PROD.OUTLOOK.COM (2603:10d6:10:d9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Tue, 14 Jul
 2026 13:49:50 +0000
Received: from CP4P284MB2402.BRAP284.PROD.OUTLOOK.COM
 ([fe80::7b77:a104:ca62:b600]) by CP4P284MB2402.BRAP284.PROD.OUTLOOK.COM
 ([fe80::7b77:a104:ca62:b600%6]) with mapi id 15.21.0223.008; Tue, 14 Jul 2026
 13:49:50 +0000
From: Lucas Martins Alves <lucas.alves@lumal21.com.br>
To: "b-liu@ti.com" <b-liu@ti.com>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Lucas Martins Alves
	<lucas.alves@lumal21.com.br>, "b-liu@ti.com" <b-liu@ti.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: Lucas Martins Alves <lucas.alves@lumal21.com.br>
Subject: [PATCH] usb: musb: host: clear stale RX interrupt on three-strikes
 error
Thread-Topic: [PATCH] usb: musb: host: clear stale RX interrupt on
 three-strikes error
Thread-Index: AQHdE5ejrinCfk4Pz0q0hTuBoIT9pg==
Date: Tue, 14 Jul 2026 13:49:49 +0000
Message-ID: <20260714134941.18508-1-lucas.alves@lumal21.com.br>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.53.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lumal21.com.br;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CP4P284MB2402:EE_|ROAP284MB2027:EE_
x-ms-office365-filtering-correlation-id: b3a90819-91a1-4921-8d87-08dee1aec636
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|6133799003|56012099006|11063799006|18002099003|38070700021;
x-microsoft-antispam-message-info:
 I4BFPO09TiEpU2U3mM4sMIy6zXApsR/OMkHCnn5bS75KccWkzF/2lLkF7FqIYwbvbSBM7QnM5RvTfmSooz99Ykq1OfAekhuni6kWMqDTYDJGi42IynOed4XZtCu2Kdb5kBC54cOHkXxKvaiDqaWqIWaEmiqyHW7hkEMvRGkA8OqQNtLoeojZHM3YqWsUHspHKgg4CiBLBiNQiAfh3aJbcruGw4s9xodgVgBaMff0szEuJfvoiTomfW/RnLvI0GhBDaIM+hwYVsqe0dkLU+X1xN4eld/vLTR95ce2lZ1aoTgwEdCM1troE3fqffiydccDq74seGCbeaJTOMZjBBztanoaZ28mJHTbjhdUgbbE7U1a2mivf4xDiOk2O9rxUIlaPQmvB109Q3B5wjXzwlfjhcwsQotBofhTk2FGq1dW1ltnHyvvZiv94F3uH6Fc7/hxuSalFYAFQa0eWOBbahZ8sOonK07Ru8H2mlOOB23JBZScONSYVLDaygAaE4lADwk5V5LDRtdrU71XOoONpz8USd4Z/xjS0/BpI2LvzEONbThjAzMGcmpmKHi3vL50BU4Jfr8AJg7OsCBJVGuU1JCJj/GjJQwHtnVWlv/CeVsCZlOhcfjg/l8S6EXfbs0jEriUHMjvUWR8qkAYtDQ3MCK3zcjEU6KIuXlmHsxDv93cVQ0PmOdgv6fNKCmnLGnIzhqZkwM6ujDrbJXCsn+ID67cc/BHlerA1XIgWVq8sL2nYyc=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CP4P284MB2402.BRAP284.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(6133799003)(56012099006)(11063799006)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NkRmWldzS2Z2V0h1ZnJZekFaTFo4KzAwNS9KRDMvTk1IMnlYUHFKVFFGTnBn?=
 =?utf-8?B?d3BxREVRb2VzMXBpdGMrbjNETklzMWZkSkw1cm4zdzJpSk4vR1orUHVEdkxh?=
 =?utf-8?B?N0R2QURPcnBQdTIvUG1WZTZzYXlLeUJ5dFQ3UldrWmhiaXN4NU1idnMvREpP?=
 =?utf-8?B?TWFLZS9nUW40RWcyREV3SDgxNU5GMUtITmxWZmpBMHFuMGtlSjdoejRpNXBr?=
 =?utf-8?B?cEhvNUlsYkNURXh2dnF4dzVkWUhaQm9vU2R1REN2UlQzb2ZtTGVuMHFaVlo5?=
 =?utf-8?B?TDhNZHFSSTRIOUhsNnZzRXcrbUxNdlJZVU9qeVdCMUdiQy9JWHhNY1NLMm45?=
 =?utf-8?B?eU5CclFKYUs3N0xBbUVGckZsZTJ3UTdSRzh1dXZLc2NlTDNNeFlWRDZONVZJ?=
 =?utf-8?B?b0NvWm5zMVFTRk9ZZTdTQ2wwRjZrMmRNaCt2ZXVnUFRWNTQwbnNFZnhEREpa?=
 =?utf-8?B?bkVkVFhhQ3RCSVYxNzIrQ3pBZXZnODdaUnVRQVFpOHVab1ByaE1sUExSVHVR?=
 =?utf-8?B?WC83YU1pV01WQi9XcHM0ZzZoRUdkamkxZjBsT3BKTENuNXgrUlZBV3ZXcGJS?=
 =?utf-8?B?Z3VtRUFBU0RMRHVNcmRHemg2c1NFb2FMWFlPczUrM3dNamY4MDRxNWxIVWtl?=
 =?utf-8?B?WlV3cVJCQUhndTFSWVhtRW96dmUzYmplbDFReDlBNHZlUmx5WDZKb3dvT0xR?=
 =?utf-8?B?cnZnMXU4b0RuRlVpcGVZSUtOY2pRaHF3UmpLYS93K3NSZzgrNGdzbnRtd2M5?=
 =?utf-8?B?OHdpZmtLOEZZTWwwWi9pcS9uS0hJUCtWd21vOURrb210UmFLdGI3VkZmYmVX?=
 =?utf-8?B?Tmo2ZWMwZnJyeVlVVlNNZFlMNTU3QXFwZDFHdmxsNTZHd2JyZzNVQUdwbWtq?=
 =?utf-8?B?UUcyQmpJUi83a0ZPMTlqV1VsN29sSDM2bnJ2ODVCTllGLzFDVmcyNlFtZVdM?=
 =?utf-8?B?Q1JHeDhURHJoOWJMZW1LSmNyRFZ3VU1Od2c1d2xXQWU3V2txZ0lxVWZ6QU56?=
 =?utf-8?B?RndPUDN3R3hUd3lvK1J2SElQNHJiUEg2b0RZanl0VzJlcjQ5Ty9BcWp4c2gr?=
 =?utf-8?B?cGtBMU1NejcvYVk1WVNPT3BrRC9ZNTdUbjhNdXR1SitmTk1BUEYxanJ6dUFC?=
 =?utf-8?B?a245OG90RGJiY3ZxNUxjT1hldEpCc1RZVElXejRxWDhoYTNJbkhQb01Hb1h1?=
 =?utf-8?B?RTl3K2tSSU5yS1BHRHRWbHk4QzhvdzVYSkRCVlJpYXFOZjJSTXVrK1RoL3BG?=
 =?utf-8?B?Nm5QVDBjLzBNQXNsVmYra1NqN1VaVy9hTXlYc1o1ZzRFUjlZdjVjUDkvYmVh?=
 =?utf-8?B?MmdvS0lOZWVWWE1KMXJoeEFPUVZxbWtiYVpoRnlBY0FGVGZGOWcyQ3J5LzBy?=
 =?utf-8?B?M3FuSEZYR2dKdnNvZmdHMFRKejErY3crSzFsbHhsajB5aFUybkUraW55MW9y?=
 =?utf-8?B?d3VYdmRMS0xnZjNrbG4yRmtkajFPeDVBMFo3bzg2S3ROVFhZOWk5UXUrVGRI?=
 =?utf-8?B?Qm91R3dtSXRUa3Z4TWxNSUZEOUV5RGZoS1ltTkZwc1JtdGMzbWxpeUZmaXNw?=
 =?utf-8?B?S2dNcFlIVGlFQit2RlVXZmRqVlZ2bFl3UkJMazlFOVRsNTBxS0dwRVdGREgw?=
 =?utf-8?B?ZzBVS3ZmTU5iMlNFTTBmdWRyOTJ4cmJaTmludHdKODA3aHlxbVphWWZ2Y1kx?=
 =?utf-8?B?ZVRyYlMxVzZpYkVFRG1wdlJDdURmaVUweHNWWEJmY21Ga2lUZ3ZIOGlDZHdV?=
 =?utf-8?B?SHA4M3hDSEJjb0xzU3ZmUk9ieHE4WDA1MmoxaThJcGM0SkF2UUVLR24zdjRP?=
 =?utf-8?B?THBEdVpxNURrSzlkNlhoNDJhUmNsOEdtMHFNaGRUNGFMNjNEczZyQU50SDhJ?=
 =?utf-8?B?WmtBbk5RTnNhTTlyMzc0OHROczRERjBzOWZnQ1l5cDFKWXhvUExWQzZwQklh?=
 =?utf-8?B?Q0g5Tm9BSDgwNWdXMnptd3FydkQxTzVkVjl3Y0M1bXlJTDVKNmpoOHdmZXFp?=
 =?utf-8?B?SmIwbS93RFVEMTByZVJvSnNVa0FLQ2VGVm93SGgvcTg1bzJRems5L1FTNkFG?=
 =?utf-8?B?TUxCam1FNVArbk9oS3ZRVEVzNGFXTGtpeTNPYUlyNVhjc1ZlOFJ5YXA2Njlw?=
 =?utf-8?B?RDRiakRZU25sMElHU1hPeEJyYk95T0JSQUZYS2hJbnlTb2hGV1plMGRJci9l?=
 =?utf-8?B?eUdLY1ZvbGd6dkhQQi9FRU8vdGRabmxNWUxyTWtyaVdCcDBPZDN5ZU9QQjlz?=
 =?utf-8?B?U0phNUkxWC9PbDFJeDhwSFgvbEdXYTNiTkF1KzFHdDZUMCsvTVNNenhkcjlr?=
 =?utf-8?B?YkFjckhITDhJbnk2Q3duNUVnOWtKTWF0cHo4K0FZWDJsTUEvdk1odz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: lumal21.com.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP4P284MB2402.BRAP284.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b3a90819-91a1-4921-8d87-08dee1aec636
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2026 13:49:49.9187
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 99055dd4-6575-473d-944c-c3b1a5a6649e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QdXcurz8zsvxnZJLjBz8WCDTBlnf+Xd+0GVYy0AobWxtWRcIMTkMW+U6zbfXpEesP4qJfkhjvueGAQOcmsLb4ZL+O9+YIa3v9rwpq4wyaok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ROAP284MB2027

RnJvbTogTHVjYXMgTWFydGlucyBBbHZlcyA8bHVjYXMuYWx2ZXNAbHVtYWwyMS5jb20uYnI+CgpV
bnBsdWdnaW5nIGEgYnVzeSBVU0IgRXRoZXJuZXQgYWRhcHRlciBjYW4gbGVhdmUgYSBzdGFsZSBS
WCBpbnRlcnJ1cHQKcGVuZGluZyB3aGlsZSB0aGUgaG9zdCBoYW5kbGVzIE1VU0JfUlhDU1JfSF9F
UlJPUi4gT24gQU0zMzV4L0RTUFMKcGxhdGZvcm1zIHRoaXMgY2FuIHJldHJpZ2dlciB0aGUgc2Ft
ZSB0aHJlZS1zdHJpa2VzIGVycm9yIGJlZm9yZSB0aGUKZGlzY29ubmVjdCBwYXRoIGNvbXBsZXRl
cywgZmxvb2RpbmcgdGhlIGxvZyBhbmQgcG90ZW50aWFsbHkgbGVhdmluZyB0aGUKaG9zdCBwb3J0
IHN0dWNrIHVudGlsIHJlYm9vdC4KCkNsZWFyIHRoZSBwZW5kaW5nIGVuZHBvaW50IFJYIGludGVy
cnVwdCB3aGVuIGFib3J0aW5nIHRoZSB0cmFuc2ZlciBzbwp0aGUgZXJyb3Igc3Rvcm0gaXMgYnJv
a2VuLCBhbmQgcmF0ZSBsaW1pdCB0aGUgZXJyb3IgbWVzc2FnZSB0byBhdm9pZApzcGFtbWluZyB0
aGUgbG9nIHdoaWxlIHRoZSBmYXVsdCBwYXRoIGNvbXBsZXRlcy4KClNpZ25lZC1vZmYtYnk6IEx1
Y2FzIE1hcnRpbnMgQWx2ZXMgPGx1Y2FzLmFsdmVzQGx1bWFsMjEuY29tLmJyPgotLS0KIGRyaXZl
cnMvdXNiL211c2IvbXVzYl9ob3N0LmMgfCAxNCArKysrKysrKysrKysrLQogMSBmaWxlIGNoYW5n
ZWQsIDEzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L3VzYi9tdXNiL211c2JfaG9zdC5jIGIvZHJpdmVycy91c2IvbXVzYi9tdXNiX2hvc3QuYwppbmRl
eCA4ZWZkMmZhNDcyZjkuLjMxYjA2MTI0ODk5MSAxMDA2NDQKLS0tIGEvZHJpdmVycy91c2IvbXVz
Yi9tdXNiX2hvc3QuYworKysgYi9kcml2ZXJzL3VzYi9tdXNiL211c2JfaG9zdC5jCkBAIC0xNzc0
LDcgKzE3NzQsOCBAQCB2b2lkIG11c2JfaG9zdF9yeChzdHJ1Y3QgbXVzYiAqbXVzYiwgdTggZXBu
dW0pCiAJCXN0YXR1cyA9IC1FUElQRTsKIAogCX0gZWxzZSBpZiAocnhfY3NyICYgTVVTQl9SWENT
Ul9IX0VSUk9SKSB7Ci0JCWRldl9lcnIobXVzYi0+Y29udHJvbGxlciwgImVwJWQgUlggdGhyZWUt
c3RyaWtlcyBlcnJvciIsIGVwbnVtKTsKKwkJZGV2X2Vycl9yYXRlbGltaXRlZChtdXNiLT5jb250
cm9sbGVyLAorCQkJCSAgICAiZXAlZCBSWCB0aHJlZS1zdHJpa2VzIGVycm9yXG4iLCBlcG51bSk7
CiAKIAkJLyoKIAkJICogVGhlIHRocmVlLXN0cmlrZXMgZXJyb3IgY291bGQgb25seSBoYXBwZW4g
d2hlbiB0aGUgVVNCCkBAIC0xNzg4LDYgKzE3ODksMTcgQEAgdm9pZCBtdXNiX2hvc3Rfcngoc3Ry
dWN0IG11c2IgKm11c2IsIHU4IGVwbnVtKQogCQlyeF9jc3IgJj0gfk1VU0JfUlhDU1JfSF9FUlJP
UjsKIAkJbXVzYl93cml0ZXcoZXBpbywgTVVTQl9SWENTUiwgcnhfY3NyKTsKIAorCQkvKgorCQkg
KiBVbnBsdWdnaW5nIGEgVVNCLUV0aGVybmV0IGFkYXB0ZXIgd2hpbGUgaXQgaXMgYnVzeSBjYW4g
bWFrZQorCQkgKiB0aGUgY29udHJvbGxlciBrZWVwIHJlLWFzc2VydGluZyB0aGUgdGhyZWUtc3Ry
aWtlcyBlcnJvciBmb3IKKwkJICogdGhpcyBlbmRwb2ludCBiZWZvcmUgdGhlIGRpc2Nvbm5lY3Qg
aXMgcHJvY2Vzc2VkLiBUaGF0IGZsb29kcworCQkgKiB0aGUgbG9nIGFuZCBjYW4gd2VkZ2UgdGhl
IGhvc3QgcG9ydCB1bnRpbCByZWJvb3QuIERyb3AgdGhlCisJCSAqIHN0YWxlIHBlbmRpbmcgUlgg
aW50ZXJydXB0IG9uIHBsYXRmb3JtcyB0aGF0IHN1cHBvcnQgaXQgKGUuZy4KKwkJICogQU0zMzV4
L0RTUFMpIHRvIGJyZWFrIHRoZSBzdG9ybTsgdGhlIHRyYW5zZmVyIGlzIHN0aWxsCisJCSAqIGFi
b3J0ZWQgYmVsb3cgdmlhIHRoZSBmYXVsdCBwYXRoLgorCQkgKi8KKwkJbXVzYl9wbGF0Zm9ybV9j
bGVhcl9lcF9yeGludHIobXVzYiwgZXBudW0pOworCiAJfSBlbHNlIGlmIChyeF9jc3IgJiBNVVNC
X1JYQ1NSX0RBVEFFUlJPUikgewogCiAJCWlmIChVU0JfRU5EUE9JTlRfWEZFUl9JU09DICE9IHFo
LT50eXBlKSB7Ci0tIAoyLjUzLjAKCg==
